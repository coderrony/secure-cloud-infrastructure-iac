variable "vpc_id" {
  description = "VPC ID where EC2 instances will be launched"
  type        = string
}
variable "public_subnet_id" {
  description = "public subnet id"
  type = string
}
variable "private_subnet_id" {
  description = "private subnet id"
  type = string
}
variable "ami_id" {
  description = "Optional AMI ID to use for EC2 instances. If not provided, the latest Ubuntu 22.04 LTS AMI will be used."
  type        = string
}
variable "key_name" {
  description = "Name of the existing AWS Key Pair to use for EC2 instances"
  type        = string
}
variable "common_tags" { type = map(string) }

variable "instance_type_public" {
  description = "public instance"
  type = string
}
variable "instance_type_bastion" {
  description = "bastion instance"
  type = string
}
variable "instance_type_private" {
  description = "private instance"
  type = string
}

variable "public_sg_id" {
  description = "public security group ID"
  type = string
}
variable "private_sg_id" {
  description = "private security group ID"
  type = string
}