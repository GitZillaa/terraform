provider "random" {}

resource "random_password" "password" {
  length           = 16
  special          = true
  upper            = true
  lower            = true
  numeric           = true
  override_special = "!#$%&*()-_=+[]{}<>:?/"
}

output "random_password" {
  value = random_password.password.result
  sensitive = true
}