terraform {
  required_providers {
    dynatrace = {
      version = "1.16.0"
      source  = "dynatrace-oss/dynatrace"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

}

provider "dynatrace" {
  dt_env_url   = var.dt_env_url
  dt_api_token = var.dt_token
}


provider "aws" {
  region     = "eu-central-1"
  access_key = var.aws_acc_key
  secret_key = var.aws_secret
}
