output "Userage" {
    value = "Username is ${var.Username} and his/her age is ${lookup(var.Userage, "${var.Username}")}."
}


// for taking dictionary form the cmd you'll use,
/*
    terraform plan -var 'Map_Variable_name{"name"=value,"name"=value,"name"=value,}'
*/