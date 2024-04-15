provider "null" {}

resource "null_resource" "execute_script" {
  provisioner "local-exec" {
    command = "sh ${path.module}/script.sh"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}