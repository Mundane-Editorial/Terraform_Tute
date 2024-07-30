resource "aws_instance" "web" { // creating aws instance 
  ami                    = var.image_id
  instance_type          = var.instance_id
  key_name               = aws_key_pair.tf_key.key_name           // attaching key pair
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"] // attaching security group
  tags = {
    Name = "first_tf_instance",
  }
  user_data = file("${path.module}/dockerscript.sh")

  //Terraform Provisioners :: used to copy a file from local device to remote instance 
  # there are 3 types of provisioners :: 
  // 1. fILE
  // 2. local-exec
  // 3. remote-exec

  connection { // putting connection block here will make it global and will be assigned to all the provisioner blocks whenever needed.
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/ssh_key/id_rsa")
    host        = self.public_ip
  }

  provisioner "file" {
    # source      = "./test_file/test_file.txt"
    # destination = "/tmp/test_file.txt"

    source      = "./openshift/openshift.tar"
    destination = "/tmp/openshift/"

    # connection {
    #   type = "ssh"
    #   user = "ubuntu"
    #   private_key = file("${path.module}/ssh_key/id_rsa")
    #   # host = "${aws_instance.web.public_ip}"   this part will create an loop as it is dependent on itself so, we'll use
    #   host = "${self.public_ip}"
    # }
  }

  # provisioner "file" {
  #   content = "this is the test provisioner string text content"
  #   destination = "/tmp/content.md"
  #   # connection {
  #   #   type = "ssh"
  #   #   user = "ubuntu"
  #   #   private_key = file("${path.module}/ssh_key/id_rsa")
  #   #   host = "${self.public_ip}"
  #   # }
  # }

  # // these provisioners will run according to the order how they are written 

  # provisioner "local-exec" {    // local-exec will run the commands in your local machine(instance)
  #   command = "echo ${self.public_ip} > /tmp/mypublicip.txt"
  # }

}
