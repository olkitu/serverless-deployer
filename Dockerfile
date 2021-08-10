FROM node:14.7-alpine

# Install AWS CLI and serverless
RUN apk add --no-cache py-pip \
    && pip install awscli \
    npm install -g serverless