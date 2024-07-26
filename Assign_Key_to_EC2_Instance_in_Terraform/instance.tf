
#Creating ssh-key 
resource "aws_key_pair" "key_tf" {
  key_name   = "key_tf"
  public_key = file("${path.module}/ssh_key/id_rsa.pub")   // we will use this instead of the above ugly key code. 
}

output "keyname" {
  value = "${aws_key_pair.key_tf.key_name}"
}


resource "aws_instance" "web" {
  ami           = "ami-0e472ba40eb589f49"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.key_tf.key_name}"    // this is how we assign a key to the instance
  tags = {
    Name = "first_tf_instance",
  }
} 