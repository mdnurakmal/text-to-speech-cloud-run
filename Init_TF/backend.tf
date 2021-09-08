
terraform {
  backend "gcs" {
    bucket  = "text-to-speech-cloud-run-bucket"
    prefix  = "terraform/init_state"
  }

}