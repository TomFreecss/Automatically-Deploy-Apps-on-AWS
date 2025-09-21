terraform {
  required_providers {
    aws = { source = "hashicorp/aws" }
  }

  backend "s3" {
    bucket         = "tomfreecss-terra-state"      # da bootstrap
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

provider "aws" { region = var.region }
