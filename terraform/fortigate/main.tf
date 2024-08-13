# use s3.amazonaws as the tfstate storage
terraform {
  required_version = ">=0.12.0" #best practice

  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
      version = "1.16.0"
    }
  }

  backend "s3" {
    bucket  = "fortios-tfstate"
    key     = "self.tfstate"
    region  = "ap-east-1"
    encrypt = true
  }

}
# Configure the FortiOS Provider
provider "fortios" {
  hostname = "your-fortigate-ip"
  token    = var.apitoken #no need quote, use quote run will fail
  insecure = "true"
}

locals {
  prefix = var.prefix
  common_tags = {
    Project   = var.project
    Owner     = var.contact
    ManagedBy = "Terraform"
  }

}