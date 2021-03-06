terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.53"
    }
  }
}

provider "google" {}

data "google_project" "project" {
}


locals {
  project = data.google_project.project.project_id
  service_name   = "text-to-speech-cloud-run"
  text_to_speech_worker_sa  = "serviceAccount:${google_service_account.text_to_speech_worker.email}"
}
