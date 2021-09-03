# Cloud Run: Google Cloud Text to Speech API

# Usage

1. Create a project in Google Cloud Console then click on the button

[![Run on Google
Cloud](https://deploy.cloud.run/button.svg)](https://deploy.cloud.run/?git_repo=https://github.com/mdnurakmal/text-to-speech-cloud-run.git)



<p align="left">
    <img src="http://ekababisong.org/assets/text-to-speech-cloud-run/text-to-speech-cloud-run.svg" align="middle" alt="Google Text to Speech with Google Cloud Run">
</p>

<br>

# Learning notes
- Cloud function does not need json credentials but Cl
- How to automatically set region from set from cloud shell
- Error deploying on standalone cloudshell
- cloud build has different environment variables from cloud shell
- Apparently GOOGLE_ENTRYPOINTit is necessary to set the equivalent of the entry point in the Dockerfile 
- gcr.io/cloudshell-images/cloudshell:latest is 7+ GB it will cause no space left error
- os.environ.get('PORT', 8080) set default environment variable PORT to 8080
- cloud run button does not read cloudbuild.yaml but instead app.json

# Original Repo from
https://github.com/dvdbisong/text-to-speech-cloud-run

# References
https://towardsdatascience.com/cloud-run-google-cloud-text-to-speech-api-dff308665c70
https://github.com/GoogleCloudPlatform/serverless-expeditions
--env GOOGLE_ENTRYPOINT="exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app"