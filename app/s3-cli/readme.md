
# Creating a simple S3 bucket from cli


## 1. Create a User IAM:

  In my case will be demo1.
  A UserGroup cloudformation will be created with the Cloudformation and s3 full access permissions.

  Do it on https://us-east-1.console.aws.amazon.com/iamv2/home?region=eu-west-1#/users

## 2. Attatch security credencials access key:

  Once the user is created you can attatch an access key to access programmatic.

  Do it on https://us-east-1.console.aws.amazon.com/iamv2/home?region=eu-west-1#/users/details/demo1?section=security_credentials


## 3. Define the .yaml configuration

  Add to element "Resources" the s3 bucket "type = AWS::S3::Bucket":
```
Resources:
  S3Bucket:
    Type: AWS::S3::Bucket
    Properties:
      BucketName: 'aws-glue-learning-series-demo2'
```

  In the last code the BucketName is hardcoded, we can use Parameters elements to allow put external parameters values on the .yml definition:
```
Parameters:
  MyBucketName:
    Type: String
Resources:
  S3Bucket:
    Type: AWS::S3::Bucket
    Properties:
      BucketName: !Ref MyBucketName
```

  External parameters.json:

```
[
  {
    "ParameterKey": "MyBucketName",
    "ParameterValue": "aws-cloudfront-learning-series-demo2"
  }
]
```

  Full bucket.yml definition:
```
Parameters:
  MyBucketName:
    Type: String

Resources:
  S3Bucket:
    Type: AWS::S3::Bucket
    Properties:
      BucketName: !Ref MyBucketName

Outputs:
  BucketName:
    Value: !Ref S3Bucket
```

## 4. Use the Cli

```
stack_name=demo2
yml=/app/s3-cli/bucket.yml
parameters=/app/s3-cli/parameters.json

/usr/local/bin/aws cloudformation create-stack \
                   --stack-name $stack_name \
                   --template-body file://$yml \
                   --parameters $parameters
```

## References:
  - https://github.com/awsdocs/aws-cloudformation-user-guide/blob/main/doc_source/using-cfn-cli-creating-stack.md
