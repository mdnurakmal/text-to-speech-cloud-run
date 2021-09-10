#!/bin/bash
gsutil -q stat gs://text-to-speech-cloud-run-bucket/terraform

return_value=$?

if [ $return_value = 0 ]; then
    echo "bucket exist"
else
    gsutil mb gs://text-to-speech-cloud-run-bucket
fi