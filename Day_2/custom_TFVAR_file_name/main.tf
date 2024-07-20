variable "name" {
    type = string
}

variable "age" {
    type = number
}

output "Userdata" {
    value = "Hello, ${var.name}. Your age is ${var.age}"
}

// ook so here to change the varibale file, you'll have to use the command "terraform plan --var-file=file_name.tfvars"   