provider "local" {}
provider "random" {}

resource "local_file" "file_name" {
    content = "Hello Terraform"
    filename = "${path.module}/${random_string.file_name.result}.txt"
}

resource "random_integer" "file_name" {
    min = 1
    max = 100
}

resource "random_string" "file_name" {
  length = 10
  special = false
  upper = false
  lower = true
  numeric = false
}

output "random_number" { 
    value = random_integer.file_name.result
}

provider "tls" {}

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_self_signed_cert" "example" {
  #der algorythm privat key musste entfernt werden weil es sonst zu berechtigungs problemen kommt
  private_key_pem = tls_private_key.example.private_key_pem

  validity_period_hours = 12
  early_renewal_hours   = 3
  is_ca_certificate     = true
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]

  dns_names = ["example.com", "example.net"]

  subject {
    common_name  = "example.com"
    organization = "ACME Examples, Inc"
  }
}
