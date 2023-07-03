output "web_server_public_ip" {
  value = aws_instance.test_01.public_ip
  description = "The public IP address for the web server"
}

output "IaC_region" {
  value = var.region
  description = "Region where IaC will be deployed"
}