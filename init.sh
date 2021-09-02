#!/bin/bash

export PROJECT_ID=`gcloud projects list --filter="PROJECT" --format="value(PROJECT_ID)"`
terraform init
terraform apply
