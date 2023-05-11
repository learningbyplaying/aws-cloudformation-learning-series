
# AWS Cloudformation Learning series



## 1. Setup the project

  a) Requirements:

    - Install docker
    - Install docker compose

  b) Up the docker-compose:

```
  cd $PATH_PROJECT
  docker-compose up -d
```

  c) Create the credentials with a key of a programmatic user that has full access to cloudformation:

```
  cp $PATH_PROJECT/app/.env.backup $PATH_PROJECT/app/.env
```

## 2. Use the project

  a) Go into the docker:

```
  sudo docker exec -it cloudformation /bin/bash
```

  b) Use the script bash "stack.sh" to create the stacks with the .yml blueprint on your cloud.
  For instance we will create the s3 bucket of demo:

```
  cd /app && ./stack.sh s3-cli/bucket.yml
```
