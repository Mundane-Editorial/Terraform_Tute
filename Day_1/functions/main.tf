output "join_function_tute" {
    value = "Hello, ${join("-->", var.Users)}"        // this is how functions are used in terraform
}


output "string_function_tute" {
    value = "this function will convert the value at particular index of a list to upper case, see, ${upper(var.Users[0])}"
}