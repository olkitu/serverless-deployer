FROM php:7.4-cli as php-image

RUN BUILD_PACKAGES='libmcrypt-dev libxml2-dev libonig-dev libzip-dev' \ 
    && apt-get update && apt-get install -y $BUILD_PACKAGES \
    && docker-php-ext-install -j$(nproc) mysqli pdo pdo_mysql tokenizer xml pcntl mbstring zip \
    && apt-get purge -y $BUILD_PACKAGES \
    && rm -rf /var/lib/apt/lists/*

FROM node:16-bullseye-slim

# Copy PHP files from php-image
COPY --from=php-image /usr/local/bin/php /usr/local/bin/php
COPY --from=php-image /usr/local/etc/php /usr/local/etc/php
COPY --from=php-image /usr/local/bin/docker-php-source /usr/local/bin/docker-php-source 
COPY --from=php-image /usr/local/lib/php /usr/local/lib/php
COPY --from=php-image /usr/local/php /usr/local/php

# Install AWS CLI and Serverless
RUN Arch="$(uname -m)" \
    && PHP_REQUIRED_LIBS="libmcrypt4 libxml2 libzip4 libargon2-0 libreadline8 libsqlite3-0 libsodium23" \
    && apt-get update && apt-get install -y jq curl unzip $PHP_REQUIRED_LIBS \
    && npm install -g serverless \
    && cd /tmp && curl "https://awscli.amazonaws.com/awscli-exe-linux-${Arch}.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf /tmp/* \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app