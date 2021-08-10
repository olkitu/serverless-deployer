# Serverless Deployer image

Run on CI example

### Gitlab CI

Example for

```yaml
deploy:
  stage: deploy
  image: docker pull ghcr.io/olkitu/serverless-deployer
  script:
  - npm ci
  - serverless deploy --verbose
```