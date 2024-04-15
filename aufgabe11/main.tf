provider "local" {}
provider "random" {}

resource "random_integer" "subnet_count" {
  min = 1
  max = 5
}

resource "random_pet" "subnet" {
  count = random_integer.subnet_count.result
}

resource "local_file" "subnet_file" {
  content = join("\n", [for s in random_pet.subnet.*.id : "Subnet name: ${s}"])
  filename = "${path.module}subnets.txt"
}

output "subnet_names" {
  value = random_pet.subnet.*.id
}

# in die console --> terraform apply -target=random_integer.subnet_count
