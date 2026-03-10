provider "aws" {
  region  = var.aws_region # Specify your preferred region
  profile = var.aws_profile # Enter your AWS Named Profile here
}

# TLS Provider for generating SSH Key
resource "tls_private_key" "main_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save private key to local system
resource "local_file" "ssh_key" {
  content  = tls_private_key.main_key.private_key_pem
  filename = "${path.module}/id_rsa.pem"
}

# Register public key in AWS
resource "aws_key_pair" "deployer" {
  key_name   = "assignment-key"
  public_key = tls_private_key.main_key.public_key_openssh
}