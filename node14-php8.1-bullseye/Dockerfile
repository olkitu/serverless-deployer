FROM php:8.1-cli as php-image

RUN BUILD_PACKAGES='libmcrypt-dev libxml2-dev libonig-dev libzip-dev exiftool libjpeg-dev libpng-dev libgd-dev' \ 
    && apt-get update && apt-get install -y $BUILD_PACKAGES \
    && pecl install mongodb \
    && docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) mysqli pdo pdo_mysql xml pcntl mbstring zip exif gd \
    && docker-php-ext-enable mongodb \
    && apt-get purge -y $BUILD_PACKAGES \
    && rm -rf /var/lib/apt/lists/*

FROM node:14-bullseye-slim

LABEL fi.truong.image.tag=node14-php8.1-bullseye

# Copy PHP files from php-image
COPY --from=php-image /usr/local/bin/php /usr/local/bin/php
COPY --from=php-image /usr/local/etc/php /usr/local/etc/php
COPY --from=php-image /usr/local/bin/docker-php-source /usr/local/bin/docker-php-source 
COPY --from=php-image /usr/local/lib/php /usr/local/lib/php
COPY --from=php-image /usr/local/php /usr/local/php

# Copy Python 3.7
COPY --from=python:3.7-slim-bullseye /usr/local/bin/python3.7 /usr/local/bin/python3.7 
COPY --from=python:3.7-slim-bullseye /usr/local/bin/python3.7m-config /usr/local/bin/python3.7m-config
COPY --from=python:3.7-slim-bullseye /usr/local/bin/python3.7-config /usr/local/bin/python3.7-config
COPY --from=python:3.7-slim-bullseye /usr/local/bin/python3.7m /usr/local/bin/python3.7m
COPY --from=python:3.7-slim-bullseye /usr/local/lib/python3.7 /usr/local/lib/python3.7
COPY --from=python:3.7-slim-bullseye /usr/local/bin/pip3.7 /usr/local/bin/pip3.7
COPY --from=python:3.7-slim-bullseye /usr/local/lib/libpython3.7m.so.1.0 /usr/local/lib/libpython3.7m.so.1.0

# Copy Python 3.8
COPY --from=python:3.8-slim-bullseye /usr/local/bin/python3.8 /usr/local/bin/python3.8 
COPY --from=python:3.8-slim-bullseye /usr/local/bin/python3.8-config /usr/local/bin/python3.8-config
COPY --from=python:3.8-slim-bullseye /usr/local/lib/python3.8 /usr/local/lib/python3.8
COPY --from=python:3.8-slim-bullseye /usr/local/bin/pip3.8 /usr/local/bin/pip3.8
COPY --from=python:3.8-slim-bullseye /usr/local/lib/libpython3.8.so.1.0 /usr/local/lib/libpython3.8.so.1.0

# Copy Python 3.9
COPY --from=python:3.9-slim-bullseye /usr/local/bin/python3.9 /usr/local/bin/python3.9 
COPY --from=python:3.9-slim-bullseye /usr/local/bin/python3.9-config /usr/local/bin/python3.9-config
COPY --from=python:3.9-slim-bullseye /usr/local/lib/python3.9 /usr/local/lib/python3.9
COPY --from=python:3.9-slim-bullseye /usr/local/bin/pip3.9 /usr/local/bin/pip3.9
COPY --from=python:3.9-slim-bullseye /usr/local/lib/libpython3.9.so.1.0 /usr/local/lib/libpython3.9.so.1.0

# Copy Python 3.10
COPY --from=python:3.10-slim-bullseye /usr/local/bin/python3.10 /usr/local/bin/python3.10 
COPY --from=python:3.10-slim-bullseye /usr/local/bin/python3.10-config /usr/local/bin/python3.10-config
COPY --from=python:3.10-slim-bullseye /usr/local/lib/python3.10 /usr/local/lib/python3.10
COPY --from=python:3.10-slim-bullseye /usr/local/bin/pip3.10 /usr/local/bin/pip3.10
COPY --from=python:3.10-slim-bullseye /usr/local/lib/libpython3.10.so.1.0 /usr/local/lib/libpython3.10.so.1.0

# Copy Python default version 3.10
COPY --from=python:3.10-slim-bullseye /usr/local/lib/libpython3.so /usr/local/lib/libpython3.so
COPY --from=python:3.10-slim-bullseye /usr/local/bin/python /usr/local/bin/python
COPY --from=python:3.10-slim-bullseye /usr/local/bin/pip3 /usr/local/bin/pip3

COPY --from=composer /usr/bin/composer /usr/bin/composer

# Copy Docker binaries
COPY --from=docker:20.10 /usr/local/bin /usr/local/bin
COPY --from=docker:20.10 /usr/libexec/docker /usr/libexec/docker

COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY scripts/* /usr/local/bin/

RUN Arch="$(uname -m)" \
    && PHP_REQUIRED_LIBS="libmcrypt4 libxml2 libzip4 libargon2-0 libreadline8 libsqlite3-0 libsodium23 exiftool libpng-dev" \
    && PYTHON_REQUIRED_LIBS="libexpat1" \
    && apt-get update && apt-get install -y jq curl unzip make $PHP_REQUIRED_LIBS $PYTHON_REQUIRED_LIBS \
    && pip3 --no-cache-dir install yq aws-sam-cli cfn-lint cfn-lint-serverless \
    && npm install -g serverless \
    && cd /tmp && curl -s "https://awscli.amazonaws.com/awscli-exe-linux-${Arch}.zip" -o "awscliv2.zip" \
    && unzip -q awscliv2.zip \
    && ./aws/install \
    && rm -rf /tmp/* \
    && rm -rf /var/lib/apt/lists/* \
    && php -v \ 
    && aws --version \
    && serverless --version \
    && python3.7 --version \
    && python3.8 --version \
    && python3.9 --version \
    && python --version \
    && docker --version \
    && docker buildx version \
    && docker-compose version

WORKDIR /app