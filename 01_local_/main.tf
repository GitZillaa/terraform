provider "local" {}

resource "local_file" "hello" {
    content = "Hello World"
    filename = "${path.module}hello.txt"
  
}
