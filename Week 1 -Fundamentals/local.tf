provider "local" {}

resource "local_file" "example" {
  filename = "${path.module}/example.txt"
  content  = "Hello, Terraform!"

}

resource "local_file" "example2" {
  filename = "${path.module}/example.txt"
  content  = "Hello, Terraform2!"

}