provider "local" {}
provider "random" {}

resource "random_string" "dir_name" {
    length = 8
    special = false 
    upper = false
    numeric= false 
}

resource "local_file" "file" { 
    content ="hello world" 
    filename = "${path.module}/${random_string.dir_name.result}.txt"
    }