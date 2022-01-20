FROM node:14.18-alpine3.14

COPY scripts/* /usr/local/bin/

# Install AWS CLI and serverless
RUN apk add --no-cache py-pip php7-cli php7-zip php7-gd php7-json php7-xml php7-openssl php7-simplexml openssl bash jq \
    && pip install awscli \
    && npm install -g serverless \
    && ln -s /usr/bin/php7 /usr/local/bin/php

WORKDIR /app