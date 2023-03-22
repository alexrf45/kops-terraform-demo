provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "tf-state-kops-stage"
    region         = "us-east-1"
    dynamodb_table = "tf-kops-locks"
    encrypt        = true
    key            = "global/kops/iam/terraform.tfstate"
  }
}


resource "aws_iam_group" "kops" {
  name = var.name
  path = "/kops/iam/"
}


data "aws_iam_policy" "ec2_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

data "aws_iam_policy" "route53fullaccess" {
  arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
}

data "aws_iam_policy" "s3fullaccess" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

data "aws_iam_policy" "dynamodbfullaccess" {
  arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

data "aws_iam_policy" "iamfullaccess" {
  arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

data "aws_iam_policy" "vpcfullaccess" {
  arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

data "aws_iam_policy" "sqsfullaccess" {
  arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
}

data "aws_iam_policy" "eventbridgefullaccess" {
  arn = "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
}

resource "aws_iam_group_policy_attachment" "kops_ec2" {
  group      = aws_iam_group.kops.name
  policy_arn = data.aws_iam_policy.ec2_full_access.arn
}

resource "aws_iam_group_policy_attachment" "kops-route53" {
  group      = aws_iam_group.kops.name
  policy_arn = data.aws_iam_policy.route53fullaccess.arn
}

resource "aws_iam_group_policy_attachment" "kops-s3" {
  group      = aws_iam_group.kops.name
  policy_arn = data.aws_iam_policy.s3fullaccess.arn
}

resource "aws_iam_group_policy_attachment" "kops-dynamodb" {
  group      = aws_iam_group.kops.name
  policy_arn = data.aws_iam_policy.dynamodbfullaccess.arn
}

resource "aws_iam_group_policy_attachment" "kops-iam" {
  group      = aws_iam_group.kops.name
  policy_arn = data.aws_iam_policy.iamfullaccess.arn
}

resource "aws_iam_group_policy_attachment" "kops-vpc" {
  group      = aws_iam_group.kops.name
  policy_arn = data.aws_iam_policy.vpcfullaccess.arn
}

resource "aws_iam_group_policy_attachment" "kops-sqs" {
  group      = aws_iam_group.kops.name
  policy_arn = data.aws_iam_policy.sqsfullaccess.arn
}

resource "aws_iam_group_policy_attachment" "kops-event-bridge" {
  group      = aws_iam_group.kops.name
  policy_arn = data.aws_iam_policy.eventbridgefullaccess.arn
}

#create the kops user

#TODO - Create virtual mfa to assign to user.



resource "aws_iam_user" "kops_user" {
  name = "kops"
  path = "/kops/user/"

  tags = {
    name        = "kops"
    environment = "kubernetes"
  }
}

resource "aws_iam_group_membership" "kops-group-mbr" {
  name = "tf-kops-group-membership"

  users = [
    aws_iam_user.kops_user.name
  ]
  group = aws_iam_group.kops.name
}

resource "aws_iam_access_key" "kops-access" {
  user = aws_iam_user.kops_user.name
}
