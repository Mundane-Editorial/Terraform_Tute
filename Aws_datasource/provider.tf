provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key_value
  secret_key = var.secret_key_value
}

data "aws_ami" "ubuntu"{
  most_recent = true
  owners = ["099720109477"]

  #name = ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20240701.1
  #root device type = ebs
  #virtualization type = 

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  filter {
    name = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}


output ami_id {
  value = data.aws_ami.ubuntu.id
}