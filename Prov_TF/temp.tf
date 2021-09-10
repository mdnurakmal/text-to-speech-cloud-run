
resource "null_resource" "health_check" {

 provisioner "local-exec" {

    command = "/bin/bash echo $GOOGLE_CLOUD_REGION"
  }
}