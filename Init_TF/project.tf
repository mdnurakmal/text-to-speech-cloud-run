# Enable services
resource "google_project_service" "texttospeech" {
  service = "texttospeech.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "run" {
  service = "run.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "iam" {
  service = "iam.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "cloudbuild" {
  service = "cloudbuild.googleapis.com"
  disable_on_destroy = true
}
