variable "region" {
  type    = string
  description = "Select region to deploy cloud run"
}

variable "versioning_enabled" {
  type        = bool
  default     = true
  description = "While set to `true`, versioning is fully enabled for this bucket."
}