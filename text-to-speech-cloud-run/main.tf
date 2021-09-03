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
  service_name   = "text-to-speech"
  cats_worker_sa  = "serviceAccount:${google_service_account.text_to_speech_worker.email}"
}

resource "null_resource" "health_check" {

 provisioner "local-exec" {

    command = "echo ${data.google_project.project.location}"
  }
}