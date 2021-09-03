#!/bin/bash

pack build / --builder gcr.io/buildpacks/builder:v1 --env GOOGLE_ENTRYPOINT="exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app"
#terraform init
#terraform apply