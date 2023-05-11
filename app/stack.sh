#!/bin/bash
set -o allexport; source /app/.env; set +o allexport

stack_name=$1
yml_name=$2
json_name=$3

yml=/app/$yml_name
json=/app/$json_name

/usr/local/bin/aws cloudformation create-stack \
    --stack-name $stack_name  \
    --template-body file://$yml \
    --parameters file://$json
