FROM node:14.7

# Install AWS CLI and serverless
RUN apt-get update && apt-get install -y python3-pip \
    && pip3 install awscli \
    && npm install -g serverless