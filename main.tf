terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.6.2"
    }
  }
}

provider "aws" {
  # Configuration options
  access_key = var.aws_akey
  secret_key = var.aws_skey
  region     = var.region

}


resource "aws_instance" "test_01" {
  ami           = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"
  tags = {
    Name = "test_01"
  }
}