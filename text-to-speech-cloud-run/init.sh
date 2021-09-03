#!/bin/bash
gcloud builds submit
terraform init
terraform apply
