resource "null_resource" "health_check" {

 provisioner "local-exec" {

    command = "cd $HOME/text-to-speech-cloud-run && gcloud builds submit -q"
  }

   depends_on = [google_project_service.cloudbuild]
}

resource "null_resource" "health_check2" {

 provisioner "local-exec" {

    command = "docker pull gcr.io/${data.google_project.project.project_id}/text-to-speech-cloud-run"
  }

   depends_on = [null_resource.health_check]
}




   
