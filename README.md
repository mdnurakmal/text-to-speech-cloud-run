# Serverless text to speech build on GCP , GO


![Alt text](/img/2.png?raw=true "Title")

<br>

# Usage

1. Create a project in Google Cloud Console
2. Click 'Run on Google' button


[![Run on Google
Cloud](https://deploy.cloud.run/button.svg)](https://deploy.cloud.run/?git_repo=https://github.com/mdnurakmal/text-to-speech-cloud-run.git)


# How to remove
1. Open cloud shell / If data in cloud shell is deleted , clone the repository again

```shell
. destroy.sh
```


# Learning notes
- gcloud shell can access GCP credentials without using json if it is set using the config set command in gcloud shell
- How to automatically set region from set from cloud shell
- Cloud build has different environment variables from cloud shell
- Apparently GOOGLE_ENTRYPOINT is necessary to set the equivalent of the entry point in the Dockerfile 
- gcr.io/cloudshell-images/cloudshell:latest is 7+ GB it will cause no space left error
- os.environ.get('PORT', 8080) set default environment variable PORT to 8080
- cloud run button does not read cloudbuild.yaml but instead app.json
- The google cloud run service is not available in asia-south1 region
- How to remove deleted service account automatically ?
- Why cloud run directory is removed and files merged ?
- How to Terraform destroy automatically ?
- GOOGLE_CLOUD_REGION only exists in cloud run button container
- TTerraform erra Import after Terraform Init then Terraform Apply
- Cloud run button terraform version is outdated
- Bash environment variables are not accessible from auto.tfvars file , use cli to pass var 
- GCSFuse copying files is extremely slow
- unable to run gsutil in the same shell as cloud run when using -q because of conflicting exit code
- terraform backend state does not create folder object in the bucket


# Original Repo from
https://github.com/dvdbisong/text-to-speech-cloud-run

# References
https://towardsdatascience.com/cloud-run-google-cloud-text-to-speech-api-dff308665c70
https://github.com/GoogleCloudPlatform/serverless-expeditions
 