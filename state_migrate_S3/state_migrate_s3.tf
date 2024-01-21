//This file will create and ec2 instance and the state file will be created in an S3 bucket instead of local machine. 

provider "aws" {
  region     = "us-east-1"
  }

resource "aws_instance" "ec2_example" {

  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t2.micro"
  
  tags = {                    //optional argument
    Name = "Hello"
  }
}

terraform {
  backend "s3" {
    bucket = "dhruv14385555"    //Create this bucket manually in console
    key = "TF"                  //name of terraform state file 
    region = "us-east-1"
  }
}