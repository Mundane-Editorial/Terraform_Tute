resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  #   vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_tls"
  }

  #   ingress {           we will make this "ingress" block dynamic
  #     description = "TLS from VPC"
  #     from_port   = 80
  #     to_port     = 80
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"] // global access
  #   }
  #   ingress {
  #     description = "TLS from VPC"
  #     from_port   = 443
  #     to_port     = 443
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }
  #     ingress {
  #     description = "TLS from VPC"
  #     from_port   = 3306
  #     to_port     = 3306
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }

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
}

output security_group_details {
  value = "${aws_security_group.allow_tls.id}"           // ${resource_name.custom_name_given.attribute}
} 