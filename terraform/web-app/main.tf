terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_route53_zone" "primary" {
  name = "devopsdeployed.com"
}

module "web_app" {
  source = "../modules/web-app"

  # Input Variables
  bucket_name      = "fgtfdemo-state"
  domain           = "devopsdeployed.com"
  environment_name = var.environment_name
  instance_type    = "t2.micro"
  create_dns_zone  = false
  db_name          = "${var.environment_name}-db"
  db_user          = "admin"
  db_pass          = var.db_pass

  depends_on = [
    aws_route53_zone.primary
  ]
}
