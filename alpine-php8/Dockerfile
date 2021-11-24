FROM node:14.17-alpine3.13

# Install AWS CLI and serverless
RUN apk add --no-cache py-pip php8-cli php8-zip php8-gd php8-json php8-xml php8-openssl php8-simplexml openssl bash jq \
    && pip install awscli \
    && npm install -g serverless \
    && ln -s /usr/bin/php8 /usr/local/bin/php

WORKDIR /app