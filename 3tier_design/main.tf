terraform {
    required_version = "~> 1.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
  }
}

#provider block
provider "aws" {
    region = "us-east-2"
    profile = "default"
}

#if using s3 backend
data "terraform_remote_state" "network" {
    backend = "s3"
config = {
    bucket = "bootcamp30-state-files"
    key    = "prod/terraform.tfstate"
    region = "us-east-2"
}
}

module "vpc" {
  source = "./vpc_module"
}