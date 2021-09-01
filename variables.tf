data "google_project" "project" {
}


variable "project" {
  default = data.google_project.project.project_id
  type        = string
  description = "Google Cloud Platform Project ID"
}

variable "region" {
  default = "asia-east1"
  type    = string
}
