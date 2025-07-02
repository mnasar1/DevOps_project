provider "aws" {
  region = "us-east-2"
}

data "aws_ssm_parameter" "ubuntu_ami" {
  name = "/aws/service/canonical/ubuntu/server/22.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
}

resource "aws_instance" "ubuntu_server" {
  ami           = data.aws_ssm_parameter.ubuntu_ami.value
  instance_type = "t2.micro"

  tags = {
    Name = "Firstserver"
  }
}
