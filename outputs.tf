
output "aws_region" {
  description = "The AWS region where resources are created"
  value       = var.aws_region
}

output "aws_profile" {
  description = "The AWS CLI named profile used for authentication"
  value       = var.aws_profile
}
output "ssh_private_key_path" {
  description = "Path to the generated SSH private key"
  value       = local_file.ssh_key.filename
}
output "ssh_public_key" {
  description = "The generated SSH public key in OpenSSH format"
  value       = tls_private_key.main_key.public_key_openssh
}

output "aws_vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
  
}
output "public_subnet_id" {
  description = "ID of the created public subnet"
  value       = aws_subnet.public.id
}
output "private_subnet_id" {
  description = "ID of the created private subnet"
  value       = aws_subnet.private.id
}
output "internet_gateway_id" {
  description = "ID of the created Internet Gateway"
  value       = aws_internet_gateway.igw.id
}
output "public_route_table_id" {
  description = "ID of the created public route table"
  value       = aws_route_table.public_rt.id
}
output "public_route_table_association_id" {
  description = "ID of the public route table association"
  value       = aws_route_table_association.public_assoc.id
}

output "public_security_group_id" {
  description = "ID of the created public security group"
  value       = aws_security_group.public_sg.id
}
output "private_security_group_id" {
  description = "ID of the created private security group"
  value       = aws_security_group.private_sg.id
}

output "public_ip" {
  description = "Public IP of the public EC2 instance"
  value       = module.ec2.public_ip
}

output "bastion_ip" {
  description = "Public IP of the bastion host"
  value       = module.ec2.bastion_ip
}

output "private_ip" {
  description = "Private IP of the private EC2 instance"
  value       = module.ec2.private_ip
}
