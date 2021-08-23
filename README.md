# Serverless Deployer image

Serverless deployer images to run in Gitlab CI to deploy to AWS environment.

* Latest Node LTS - 14.7 now
* PHP 7 or 8
* Python
* Serverless

## Tags

* `latest`, `php8-alpine` - Latest Alpine with Node LTS and PHP8
* `latest-debian` - Latest Debian Buster slim with Node LTS and PHP 7.3
* `php7-alpine` - Latest Alpine with Node LTS and PHP 7.4

Supported arch linux/amd64,linux/arm/v7,linux/arm64/v8 . All images will update weekly automatically.

## Usage

Mount from your local home directory AWS directory to container

```
docker run --rm -v "$HOME/.aws:/home/node/.aws:ro" -v "$(pwd):/app" ghcr.io/olkitu/serverless-deployer serverless deploy
```

Or give AWS access_keys via environment variables

```
-e AWS_ACCESS_KEY
-e AWS_SECRET_KEY
-e AWS_DEFAULT_REGION
```

### Gitlab CI

Example for

```yaml
deploy:
  stage: deploy
  image: ghcr.io/olkitu/serverless-deployer
  script:
  - npm ci
  - serverless deploy --verbose
```