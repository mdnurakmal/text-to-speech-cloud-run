# The Cloud Run service
resource "google_cloud_run_service" "text_to_speech" {
  name                       = local.service_name
  location                   = var.region
  autogenerate_revision_name = true

  template {
    spec {
      service_account_name = google_service_account.text_to_speech_worker.email
      containers {
        image = "gcr.io/${local.project}/${local.service_name}"
      }
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }

   depends_on = [null_resource.cloudbuild]
}

# Set service public
data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.text_to_speech.location
  project  = google_cloud_run_service.text_to_speech.project
  service  = google_cloud_run_service.text_to_speech.name
  policy_data = data.google_iam_policy.noauth.policy_data
}
