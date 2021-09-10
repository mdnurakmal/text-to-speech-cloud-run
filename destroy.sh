#!bin/bash
cd Prov_TF && terraform destroy -auto-approve -input=false
cd ..
cd Init_TF && terraform destroy -auto-approve -input=false
cd ..
gsutil rm -r gs://text-to-speech-cloud-run-bucket