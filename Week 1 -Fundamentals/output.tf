
provider "local" {
  alias = "output"
}
resource "local_file" "example3" {
  filename = "${path.module}/example3.txt"
  content  = "Hello, Terraform!"

}


output "example3" {
  # sensitive =true
  value = local_file.example3.content
}