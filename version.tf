terraform {
  required_version = "~>1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.13"
    }
  }
  backend "s3" {
    bucket         = "statestoreseptbucket"
    key            = "statestore-batch-sept.tfstate"
    region         = "us-east-1"
    role_arn       = "arn:aws:iam::869510502397:role/admin_role"
    dynamodb_table = "statelocktable"
  }
}

provider "aws" {
  region  = var.region
  assume_role {
    role_arn     = "arn:aws:iam::869510502397:role/admin_role"
    session_name = "batch_sept_provisioning"
  }
}

# provider "aws" {
#   region  = "us-west-1"
#   alias   = "usw1"
#   profile = "batch_sept"
#   assume_role {
#     role_arn     = "arn:aws:iam::869510502397:role/admin_role"
#     session_name = "batch_sept_provisioning"
#   }
# }
