resource "aws_key_pair" "tf_key" { // creating keypair for instance
  key_name   = "tf_key"
  public_key = file("${path.module}/ssh_key/id_rsa.pub")
}

resource "aws_security_group" "allow_tls" { //creating security group for instance 
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  #   vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_tls"
  }

  dynamic "ingress" {
    for_each = [22, 80, 443, 3306, 27017]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


resource "aws_instance" "web" { // creating aws instance 
  ami             = "ami-0e472ba40eb589f49"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.tf_key.key_name           // attaching key pair
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"] // attaching security group
  tags = {
    Name = "first_tf_instance",
  }
}

