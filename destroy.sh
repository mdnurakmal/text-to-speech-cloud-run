#!bin/bash
cd Prov_TF
terraform init
terraform state pull
terraform destroy -auto-approve -input=false

cd ..

cd Init_TF 
terraform init
terraform state pull
terraform destroy -auto-approve -input=false

gsutil rm -r gs://text-to-speech-cloud-run-bucket