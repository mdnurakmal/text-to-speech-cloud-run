#!bin/bash

cd terraform 
terraform init
terraform state pull
terraform destroy -auto-approve -input=false

gsutil rm -r gs://text-to-speech-cloud-run-bucket