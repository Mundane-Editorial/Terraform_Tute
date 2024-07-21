// here, out provider is github for creating repo in it 

provider "github" {
  
}

resource "github_repository" "terraform-first-repo" {
  name        = "first_repo_from_terraform"
  description = "teste repo created form terraform"
  visibility = "private"
  // to create a readme file, you'll use,
  auto_init = true
}