terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.47.0"
    }
  }
  backend "s3" {
    bucket = "ak-static-website-bucket"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}