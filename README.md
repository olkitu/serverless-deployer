# Serverless Deployer image

Serverless deployer images to run in Gitlab CI to deploy to AWS environment.

* Node 14, 16, 18
* PHP 7.4, 8.0 or 8.1
* Python 3.7, 3.8 and 3.9. 3.9, 3.10 is default.
* AWS-CLI v2, AWS-SAM CLI
* Serverless
* Docker

## Supported Tags

* Node 18 LTS & PHP 8.2: `latest`, `node18-php8`, `node18-php8.2`, `node18-php8.2-bullseye`
* Node 18 LTS & PHP 8.1: `node18-php8.1`, `node18-php8.1-bullseye`
* Node 18 LTS & PHP 8.0: `node18-php8.0`, `node18-php8.0-bullseye`
* Node 18 & PHP 7.4: `node18-php7`, `node18-php7.4`, `node18-php7.4-bullseye`
* Node 16 LTS & PHP 8.2: `node16-php8`, `node16-php8.2`, `node16-php8.2-bullseye`
* Node 16 LTS & PHP 8.1: `node16-php8.1`, `node16-php8.1-bullseye`
* Node 16 LTS & PHP 8.0: `node16-php8.0`, `node16-php8.0-bullseye`
* Node 16 LTS & PHP 7.4: `node16-php7`, `node16-php7.4`, `node16-php7.4-bullseye`
* Node 14 LTS & PHP 8.1: `node14-php8`, `node14-php8.2`, `node14-php8.2-bullseye`
* Node 14 LTS & PHP 8.1: `node14-php8.1`, `node14-php8.1-bullseye`
* Node 14 LTS & PHP 8.0: `node14-php8.0`, `node14-php8.0-bullseye`
* Node 14 LTS & PHP 7.4: `node14-php7`, `node14-php7.4`, `node14-php7.4-bullseye`

Supported arch's are linux/amd64,linux/arm64/v8 . All supported images will update weekly automatically.

## Usage

Mount from your local home directory AWS directory to container

```
docker run --rm -v "$HOME/.aws:/root/.aws:ro" -v "$(pwd):/app" ghcr.io/olkitu/serverless-deployer serverless deploy
```

Or give AWS access_keys via environment variables

```
-e AWS_ACCESS_KEY
-e AWS_SECRET_KEY
-e AWS_DEFAULT_REGION
```

### Gitlab CI

Example

```yaml
deploy:
  stage: deploy
  image: ghcr.io/olkitu/serverless-deployer:node16-php8.0
  script:
  - npm ci
  - serverless deploy --verbose
```