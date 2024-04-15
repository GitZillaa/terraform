provider "local" {}
provider "random" {}

variable "dir_name" {
    description = "value of the directiory name"
    type = string
    default = "test"
}

resource "random_string" "file_name" {
    length = 10
    special = false
    upper = false
    lower = true
    numeric = false
}

locals {
  full_file_name = "${var.dir_name}/${random_string.file_name.result}.txt"
}
resource "local_file" "file" {
    content = "hello World!"
    filename = "${path.module}/${local.full_file_name}"
    directory_permission = "0644"
    file_permission =  "0644"
  
}

output "directory_and_file_name" {
    value = local.full_file_name
  
}