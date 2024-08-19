provider "local" {
  alias = "provider"
}

resource "local_file" "example" {
  filename = "${path.module}/example1.txt"
  content  = "Hello, Terraform!"

}

resource "local_file" "example2" {
  filename = "${path.module}/example2.txt"
  content  = "Hello, Terraform2!"

}