variable users {
  type = list
}

output "Usernames" {
    value = "Hello, first user ${var.users[0]}"
}
