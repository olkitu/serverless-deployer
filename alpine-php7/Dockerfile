FROM node:14.17-alpine3.13

# Install AWS CLI and serverless
RUN apk add --no-cache py-pip php7-cli php7-zip php7-gd php7-json php7-xml php7-openssl openssl \
    && pip install awscli \
    && npm install -g serverless