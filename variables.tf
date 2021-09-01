data "google_project" "project" {
}


variable "project" {
  type        = string
  description = "Google Cloud Platform Project ID"
}

variable "region" {
  default = "asia-east1"
  type    = string
}

resource "null_resource" "enforce_remediation" {
  provisioner "local-exec" {
    command = "echo ${data.google_project.project.projectid}"
  }
}