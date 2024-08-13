# use s3.amazonaws as the tfstate storage
terraform {
  backend "s3" {
    bucket  = "terraformstatebucket-self"
    key     = "self.tfstate"
    region  = "ap-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = "ap-east-1"
}

locals {
  prefix = var.prefix
  common_tags = {
    Project   = var.project
    Owner     = var.contact
    ManagedBy = "Terraform"
  }

}