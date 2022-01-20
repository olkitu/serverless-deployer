#!/bin/bash

# This script checks if Laravel APP_KEY and DB_PASSWORD environment variables set

if [ -z ${APP_KEY} ] || [ -z ${DB_PASSWORD} ]; then
    echo "Required environment APP_KEY or DB_PASSWORD empty."
    exit 1
fi

# Check APP_KEY is in base64 format
if [[ ! "${APP_KEY}" =~ "base64:" ]]; then
    echo "APP_KEY environment variable is invalid"
    exit 1
fi

exit 0