
# 3. Public EC2 Instance
resource "aws_instance" "public_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type_public
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.public_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = true
  tags = merge(var.common_tags, { Name = "Public-EC2" })
}

# 4. Bastion Host
resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type_bastion
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.public_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = true
  tags = merge(var.common_tags, { Name = "Bastion-Host" })
}

# 5. Private EC2 Instance
resource "aws_instance" "private_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type_private
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.private_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = false # No public IP for private instance
  tags = merge(var.common_tags, { Name = "Private-EC2" })
}