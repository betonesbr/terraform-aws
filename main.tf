terraform {
  backend "s3" {
    bucket = "empresa-terraform-state"
    key    = "bi-projeto-hml/terraform.state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "${var.region}"
  profile = "${var.profile}"
}

