provider "local" {}

data "archive_file" "zip" {
    type = "zip"
    source_dir = "${path.module}/data/files"
    output_path = "${path.module}/data.zip"
}
    