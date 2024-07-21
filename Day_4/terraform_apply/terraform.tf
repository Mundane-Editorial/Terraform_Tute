

provider "github" {
  token = "${var.github_token}"
}

// now in this file we'll terraform that in which accout he has to make a repoo

// install terrafor deoendencies in it by executing "terraform init command"

resource "github_repository" "terraform-first-repo" {
  name        = "first_repo_from_terraform"
  description = "teste repo created form terraform"
  visibility = "private"
  // to create a readme file, you'll use,
  auto_init = true
}