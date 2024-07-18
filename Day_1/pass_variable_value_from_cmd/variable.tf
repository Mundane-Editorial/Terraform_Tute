variable "Username" {}

output "name" {
    value = "Hey, ${var.Username}"
}

//read info.txt