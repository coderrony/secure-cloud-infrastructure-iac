

# Get latest Ubuntu 22.04 LTS AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Local Variables
# ============================================================================

locals {
  ami_id = var.ami_id != "" ? var.ami_id : data.aws_ami.ubuntu.id

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}


# EC2 Module - Public, Bastion, Private Instances
# ============================================================================

module "ec2" {
  source = "./modules/ec2"

  # Networking inputs
  vpc_id            = aws_vpc.main.id
  public_subnet_id  = aws_subnet.public.id
  private_subnet_id = aws_subnet.private.id
  public_sg_id     = aws_security_group.public_sg.id
  private_sg_id    = aws_security_group.private_sg.id

  # Instance Configuration
  ami_id                 = local.ami_id
  key_name               = aws_key_pair.deployer.key_name
  instance_type_public   = var.instance_type_public
  instance_type_bastion  = var.instance_type_bastion
  instance_type_private  = var.instance_type_private
  
  common_tags       = local.common_tags
}