variable "age" {
  type = number
}

output "username" {
    value = "hello, ${var.age}"
}


// if you want to declare an environment variable in terminal you'll use 
/*
        $env:variable_name=value
*/



// and if you want to read any environment variable from terminal yoou'll use,
/*
        echo &env:variable_name
*/


// now to read the environment variable in cli you'll use
/*
        $ENV:TF_VAR_variable_name=value
*/


// at the end execute,
/*
        terraform apply
*/