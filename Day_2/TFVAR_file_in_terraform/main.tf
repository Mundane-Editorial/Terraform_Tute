variable "name" { 
  type = string
}

variable "age" {
    type = number
}


output "userdata" {
    value = "Hello, ${var.name}, your age is ${var.age}."
}

// in order to seperate all the variables form the main executable file, add your varibles into another file names "terraform.tfvars" : strictly 