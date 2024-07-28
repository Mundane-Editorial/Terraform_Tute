resource "aws_instance" "web" { // creating aws instance 
  ami                    = var.image_id
  instance_type          = var.instance_id
  key_name               = aws_key_pair.tf_key.key_name           // attaching key pair
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"] // attaching security group
  tags = {
    Name = "first_tf_instance",
  }
  user_data = file("${path.module}/script.sh")

}

