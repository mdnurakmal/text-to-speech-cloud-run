#!/bin/bash
gcloud builds commit
terraform init
terraform apply
