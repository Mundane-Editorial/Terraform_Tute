
#Creating ssh-key 
resource "aws_key_pair" "key_tf" {
  key_name   = "key_tf"
  # public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD7A3+5neYe9aN3gEw8wZI8oA6e+6SJg+qVcrOEA2dzXmrCXHtX5PjtWxgxXm2S/SgBL+kxu+T2wegZeRlUPzCSrkoTmgnWFNy4eDCxIwqE7/7XQ8FmG3f5jBFCd3rYznN4+GMdleTIj9VEeYaHDq1M5Z4RsFQYbrM4V/dF3jZPs+7N3UMq733QiE5DaxSME+n/NRXFODLAK89XB4SM5r05tKnKlxI4kcSIzEWFPvv0vKbSml66CArQBi5k77/hA3soQHrFodV+fH/3HFfhJxNNhL41Ys49Twp53H/Rsyw9Dg6lWcEDpx3Up/PFtvbtTz0oojcOhTjHPd4hrStduuuAg3NtdapoqVo1r6UWY7ddzIGuXNuVcPfaxmKTt3De+rzwhf9S9fIdCo7gNklUc0p679WFNoF1Tj3jDPTwPJ1lRpLbQ7td98+61E5QJbCxqGH3fTlsBGK6Wrpm+TBOrO4yxtbNF+C3gRJNTecaC9fhqrKLvIPX7EIjSlQPBlv0oGc= uday2@NIGHTMARE"
  public_key = file("${path.module}/ssh_key/id_rsa.pub")   // we will use this instead of the above ugly key code. 
}

output "keyname" {
  value = "${aws_key_pair.key_tf.key_name}"
}


resource "aws_instance" "web" {
  ami           = "ami-0e472ba40eb589f49"
  instance_type = "t2.micro"

  tags = {
    Name = "first_tf_instance",
  }
}