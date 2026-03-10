# 1. Public security group (for Public & Bastion Host)
resource "aws_security_group" "public_sg" {
  name        = "public-sg"
  description = "Allow SSH and HTTP access"
  vpc_id      = aws_vpc.main.id

  # SSH access (Port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # For security, it's better to specify your own IP here
  }

  # HTTP access (Port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 2. Private security group (for Private Instance)
resource "aws_security_group" "private_sg" {
  name        = "private-sg"
  description = "Allow SSH only from public SG"
  vpc_id      = aws_vpc.main.id

  # SSH access only from Public SG
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }

  # Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}