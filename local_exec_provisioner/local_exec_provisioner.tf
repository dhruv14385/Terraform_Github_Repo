//This file will create an ec2 instance in your AWS account and and text file on your local machine. 

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {

  ami           = "ami-06b09bfacae1453cb"
  instance_type = "t2.micro"

  tags = {
    Name = "Proviosner - Tutorial"
  }

  provisioner "local-exec" {
    command = "touch sample_file.txt"
  }
}