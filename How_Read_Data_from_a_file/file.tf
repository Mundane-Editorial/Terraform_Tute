output "print-file" {
  value = file("${path.module}/test-file.txt")  
}
//path.module = prints the current directory where your file is present 
// "${path.module}/test-file.txt" = now this statement will print the name of the file not the data inside the file 


// now, in order to read the file content, we'll use file() function 
//  SYNTAX : value = file("${path.module}/test-file.txt")