
variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI named profile to use for authentication"
  type        = string
}

variable "ami_id" {
  description = "Optional AMI ID to use for EC2 instances. If not provided, the latest Ubuntu 22.04 LTS AMI will be used."
  type        = string
}

variable "project_name" {
  description = "Project name for tagging resources"
  type        = string
}

variable "environment" {
  description = "Environment name for tagging resources"
  type        = string
}

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