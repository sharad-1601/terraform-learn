terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    
    bucket = "sharad-remote-backend-s3"
    key = "terraform.tfstate"
    region = "eu-west-1"

    dynamodb_table = "remote_backend_table"
  }
}

provider "aws" {
  region = "eu-west-1"
}