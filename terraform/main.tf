
terraform {
    backend "s3" {}
}

provider "aws" {
    version = "2.51.0"
    region = "us-east-2"
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
    site_name = "octatoniq"
    frontend_files_path  = "../site"
}
