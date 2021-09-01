# Enable services
resource "google_project_service" "texttospeech" {
  service = "texttospeech.googleapis.com"
  disable_on_destroy = false
}


resource "google_project_service" "run" {
  service = "run.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "iam" {
  service = "iam.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "cloudbuild" {
  service = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}


# Create a service account
resource "google_service_account" "text_to_speech_worker" {
  account_id   = "text_to_speech_worker_id"
  display_name = "Text To Speech Worker"
}

# Set permissions
resource "google_project_iam_binding" "service_permissions" {

  role       = "roles/speech.admin"
  members    = [local.cats_worker_sa]
  depends_on = [google_service_account.text_to_speech_worker]
}
