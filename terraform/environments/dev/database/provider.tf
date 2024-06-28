terraform {
  required_version = "~> 1.6.0"

  backend "s3" {
    bucket         = "atom-tf-state"
    region         = "ap-northeast-1"
    key            = "dev.tfstate"
    dynamodb_table = "terraform-state-lock"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.67.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
  default_tags {
    tags = {
      env     = var.environment
      project = var.project
      owner   = "terraform"
      tfstate = "stg"
    }
  }
}
