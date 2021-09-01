terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.53"
    }
  }
}

provider "google" {
  project = var.project
}

locals {

  service_folder = "service"
  service_name   = "text-to-speech"

  deployment_name = "cats"
  cats_worker_sa  = "serviceAccount:${google_service_account.text_to_speech_worker.email}"
}
