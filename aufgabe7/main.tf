provider "http" {}
provider "local" {}

data "http" "namechuck_norris_joke" {
  url = "https://api.chucknorris.io/jokes/random"
}

resource "local_file" "joke_file" {
    content = data.http.namechuck_norris_joke.body
    filename = "joke.txt"
  
}