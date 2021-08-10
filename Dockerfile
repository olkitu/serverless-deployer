FROM node:14.7-alpine3.12

# Install AWS CLI and serverless
RUN apk add --no-cache py-pip \
    && pip install awscli \
    npm install -g serverless