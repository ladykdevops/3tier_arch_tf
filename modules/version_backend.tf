terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  
  backend "s3" {
    bucket         = "bootcamp30-state-files"
    encrypt        = true
    key            = "temp/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-2"
}

