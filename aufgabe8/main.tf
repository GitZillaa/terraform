provider "local" {}

variable "create_file" {
  type    = bool
  default = false
}


resource "local_file" "conditional_file" {
  count    = var.create_file ? 1 : 0
  content  = "Wird nur gewollt erstellt."
  filename = "${path.module}/conditional_file.txt"
}