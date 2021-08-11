FROM node:14.7-alpine3.11

# Install AWS CLI and serverless
RUN apk add --no-cache py-pip php-cli php-zip \
    && pip install awscli \
    && npm install -g serverless