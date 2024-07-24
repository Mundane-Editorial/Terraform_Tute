resource "github_repository" "terraform_test_repo" {
  name       = "terraform_test_repo"
  visibility = "private"
  auto_init  = true
}


output "terraform_test_repo_url" {
  value = github_repository.terraform_test_repo.html_url
}


// read info.txt within same directory