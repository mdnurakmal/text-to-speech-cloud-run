FROM gcr.io/cloudshell-images/cloudshell:latest

COPY text-to-speech-cloud-run .
ENTRYPOINT ["sh","init.sh"]