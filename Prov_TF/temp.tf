
resource "null_resource" "health_check" {

 provisioner "local-exec" {

    command = "echo $GOOGLE_CLOUD_REGION"
  }
}