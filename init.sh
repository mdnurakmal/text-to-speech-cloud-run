#!/bin/bash

export PROJECT_ID=`gcloud projects list --filter="PROJECT" --format="value(PROJECT_ID)"`
gcloud config set project $PROJECT_ID
gcloud builds commit
terraform init
terraform apply
