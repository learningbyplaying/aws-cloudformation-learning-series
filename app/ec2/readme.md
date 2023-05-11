
# Creating a simple EC2


## 1. Create a keypair for access to the result EC2

  In my case I will create a keypari called "demo1".

  Do it on https://eu-west-1.console.aws.amazon.com/ec2/home?region=eu-west-1#KeyPairs:


## 2. Define the .yaml configuration

### 1. Define the properties of the security group

  Add to element "Resources" the security group with "type = AWS::EC2::SecurityGroup":

```
Resources:

  MySecurityGroup:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupDescription: Enable SSH access via port 22
      SecurityGroupIngress:
        IpProtocol: tcp
        FromPort: 22
        ToPort: 22
        CidrIp: 0.0.0.0/0

```

### 2. Define the properties of the instance

  Add to element "Resources" the instance with "type = AWS::EC2::Instance":

```
Resources:

  MyEC2Instance:
    Type: AWS::EC2::Instance

    Properties:
      InstanceType: t2.micro
      ImageId: ami-00aa9d3df94c6c354

      KeyName: !Ref MyKeyName
      SecurityGroups:
        - !Ref MySecurityGroup
```


### 3. Define the Parameters

```

Parameters:
  MyKeyName:
    Type: String

Resources:

  MyEC2Instance:
    Type: AWS::EC2::Instance

    Properties:
      InstanceType: t2.micro
      ImageId: ami-00aa9d3df94c6c354

      KeyName: !Ref MyKeyName
      SecurityGroups:
        - !Ref MySecurityGroup

  MySecurityGroup:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupDescription: Enable SSH access via port 22
      SecurityGroupIngress:
        IpProtocol: tcp
        FromPort: 22
        ToPort: 22
        CidrIp: 0.0.0.0/0
Outputs:
  InstanceID:
    Description: InstanceID
    Value: !Ref MyEC2Instance
```

## 3. Create the stack with the .yml information and the parameters filled

  Do it https://eu-west-1.console.aws.amazon.com/cloudformation/home?region=eu-west-1#/stacks/create

## 4. Deleting the stack removes all the elements created by the stack itself

## References:
  - https://www.youtube.com/watch?v=wfRW--_Vhg4
  - https://www.youtube.com/watch?v=7oosznd4Kk4
  - https://docs.aws.amazon.com/cli/latest/reference/cloudformation/create-stack.html
  - https://www.youtube.com/watch?v=YY4jVmdvLbU&t=10s&pp=ygUjYXdzIGNsb3VkZm9ybWF0aW9uIGNyZWF0ZS1zdGFjayBjbGk%3D
