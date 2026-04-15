terraform {
  backend "s3" {
    bucket = "loxtvishu-dev-terraform-ap-south-1-state"
    key    = "ec2/terraform.tfstate"
    region = "ap-south-1"
  }
}
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "loxtvishu_ec2_dev" {
  ami                    = "ami-0f559c3642608c138"
  instance_type          = "t3.micro"
  count                  = 1
  key_name               = "DevOps-key"
  subnet_id              = "subnet-03d562807e78675b1"
  vpc_security_group_ids = ["sg-0a93e5aefec4dabef"]

  tags = {
    Name = "loxtvishu-dev-pathnex-ec2-ap-south-1-01"
  }
}

output "ec2_public_ips" {
  value = aws_instance.loxtvishu_ec2_dev[*].public_ip
}
