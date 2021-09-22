FROM node:14.17-buster-slim

# Install AWS CLI and serverless
RUN apt-get update && apt-get install -y python3-pip php-cli php-zip php-gd php-json php-xml php-simplexml jq \
    && pip3 install awscli \
    && npm install -g serverless

WORKDIR /app