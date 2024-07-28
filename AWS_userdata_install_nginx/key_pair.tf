resource "aws_key_pair" "tf_key" { // creating keypair for instance
  key_name   = "tf_key"
  public_key = file("${path.module}/ssh_key/id_rsa.pub")
}
