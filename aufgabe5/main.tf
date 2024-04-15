provider "local" {}

data "template_file" "config" {
    template = file("${path.module}/template.tpl")
    
    vars = {
        user = "Marc"
        password = "12345"
    }
}
resource "local_file" "config" {
    content = data.template_file.config.rendered
    filename = "${path.module}/config.json"
}