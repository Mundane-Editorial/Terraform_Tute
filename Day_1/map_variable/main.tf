output "ages" {
  value = "His name is gaurav and his age is ${lookup(var.Userage, "gaurav")}"
}