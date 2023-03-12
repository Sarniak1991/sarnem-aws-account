terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.44"
    }
  }

  backend "s3" {
    bucket = "terraform-sarnem-state"
    key    = "terraform/remote/terraform.tfstate"
    region = "eu-central-1"
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region  = "eu-central-1"
  profile = "private"
}

module "eventbridge" {
  source  = "terraform-aws-modules/eventbridge/aws"
  version = "1.14.2"
}

//module "event-bridge" {
//  source = "./modules/event-bridge"
//  name = "eventbridge"
//}