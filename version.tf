terraform {
  required_version = "~>1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.13"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "batch_sept"
  assume_role {
    role_arn     = "arn:aws:iam::869510502397:role/admin_role"
    session_name = "batch_sept_provisioning"
  }
}