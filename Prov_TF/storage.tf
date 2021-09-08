resource "google_storage_bucket" "tf_state" {
  name          = "text-to-speech-cloud-run-bucket"
  force_destroy = true
  uniform_bucket_level_access = true
}

terraform {
  backend "gcs" {
    bucket  = "text-to-speech-cloud-run-bucket"
    prefix  = "terraform/state"
  }

   depends_on = [google_storage_bucket.tf_state]
}