

# provider "aws" {
#   region     = "us-east-1"
#   access_key = "AKIATD5UQ5EBTL4OZIW6"
#   secret_key = "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"
# }

resource "aws_instance" "web" {

  ami           = "ami-06b09bfacae1453cb"
  instance_type = "t2.micro"

  # tags = {
  #   Name = var.instance_name
  # }
}

