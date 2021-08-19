FROM node:14.17-alpine3.11

# Install AWS CLI and serverless
RUN apk add --no-cache py-pip php-cli php-zip php-gd php-json php-xml openssl \
    && pip install awscli \
    && npm install -g serverless