#!/bin/bash
gcloud config set project $1
gsutil -q stat gs://text-to-speech-cloud-run-bucket/terraform

return_value=$?

if [ $return_value = 0 ]; then
    gsutil mb gs://text-to-speech-cloud-run-bucket
else
     echo "bucket exist"
fi