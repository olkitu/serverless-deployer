#!/bin/bash
#
# Test builds

declare -a StringArray=($(ls -d node*))

docker buildx create --use --name serverless-deployer || true

for val in "${StringArray[@]}"; do
  docker buildx build \
    --cache-from ghcr.io/olkitu/serverless-deployer:$val \
    --platform linux/amd64,linux/arm64/v8 \
    -t serverless-deployer:$val \
    -f ${val}/Dockerfile .
done