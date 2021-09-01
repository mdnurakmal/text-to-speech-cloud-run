terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.53"
    }
  }
}

provider "google" {}

locals {

  service_name   = "text-to-speech"
  cats_worker_sa  = "serviceAccount:${google_service_account.text_to_speech_worker.email}"
}
