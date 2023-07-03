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
  ami                    = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.test_instance_01.id]

  user_data                   = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.web_server_port} &
              EOF
  user_data_replace_on_change = true
  tags = {
    Name = "UaR-Srv-01"
  }
}

resource "aws_security_group" "test_instance_01" {
  name = "UaR-Srv-01-SG"

  ingress {
    from_port   = var.web_server_port
    to_port     = var.web_server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
