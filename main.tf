
provider "aws" {
  region = "us-east-2"
}

# Get the latest Ubuntu 22.04 AMI
data "aws_ssm_parameter" "ubuntu_ami" {
  name = "/aws/service/canonical/ubuntu/server/22.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
}

# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Get the default security group in the default VPC
data "aws_security_group" "default" {
  filter {
    name   = "group-name"
    values = ["default"]
  }

  vpc_id = data.aws_vpc.default.id
}

# Create a new key pair using your local public key
resource "aws_key_pair" "nasar_key" {
  key_name   = "nasar-key"
  public_key = file("nasar_key.pub")  
}

# Add SSH access to default security group
resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = data.aws_security_group.default.id
}

# Launch EC2 instance
resource "aws_instance" "ubuntu_server" {
  ami                    = data.aws_ssm_parameter.ubuntu_ami.value
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.nasar_key.key_name
  vpc_security_group_ids = [data.aws_security_group.default.id]

  tags = {
    Name = "Firstserver"
  }
}
