variable "aws_akey" {
}

variable "aws_skey" {
}

variable "region" {
  description = "Default region to launch IaC, us-east-2"
  default = "us-east-2"
}

variable "web_server_port" {
  description = "The default port the webserver will use for HTTP requests"
  type = number
  default = 8080
}