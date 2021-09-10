# Create a service account
resource "google_service_account" "text_to_speech_worker" {
  account_id   = "text-to-speech-worker-id"
  display_name = "Text To Speech Worker"
}

# Set permissions
resource "google_project_iam_binding" "service_permissions" {

  role       = "roles/speech.admin"
  members    = [local.text_to_speech_worker_sa]
  depends_on = [google_service_account.text_to_speech_worker]
}
