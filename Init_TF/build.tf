resource "null_resource" "health_check" {

 provisioner "local-exec" {

    command = <<EOT
      "cd $HOME/text-to-speech-cloud-run && gcloud builds submit -q"
      "docker pull gcr.io/${data.google_project.project.project_id}/text-to-speech-cloud-run"
    EOT
  }

   depends_on = [google_project_service.cloudbuild]
}
