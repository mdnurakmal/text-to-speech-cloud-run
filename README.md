# Cloud Run: Google Cloud Text to Speech API

# Changes made
Single click cloud run deployment 

# Usage

Fork or clone this repo


<p align="left">
    <img src="http://ekababisong.org/assets/text-to-speech-cloud-run/text-to-speech-cloud-run.svg" align="middle" alt="Google Text to Speech with Google Cloud Run">
</p>

<br>

This repository provides an example for deploying applications on Cloud Run that makes API calls.  It provides sample codes for using Google Cloud Text-to-Speech APIs and running a simple web application with Flask that is packaged as a container and deployed on Cloud Run.

## Get Started

1. Open Google Cloud Shell.
2. Clone this repository by running `git clone https://github.com/dvdbisong/text-to-speech-cloud-run.git`.
3. Navigate to the code folder folder: `cd text-speech`.
4. Build the container using Cloud Build: `gcloud builds submit --tag gcr.io/[PROJECT_ID]/text-speech`.
5. Deploy to Cloud Run: `gcloud run deploy --image gcr.io/[PROJECT_ID]/text-speech --platform managed`.

# Learning notes
- Cloud function does not need json credentials but Cl

# Original Repo from
https://github.com/dvdbisong/text-to-speech-cloud-run

# References
https://towardsdatascience.com/cloud-run-google-cloud-text-to-speech-api-dff308665c70
https://github.com/GoogleCloudPlatform/serverless-expeditions
