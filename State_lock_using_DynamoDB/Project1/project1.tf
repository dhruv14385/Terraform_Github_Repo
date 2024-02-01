provider "aws" {
   region     = "us-east-1"
}

# resource "aws_dynamodb_table" "state_locking" {
#   hash_key = "LockID"
#   name     = "dynamodb-state-locking"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
#   billing_mode = "PAY_PER_REQUEST"
# }

resource "aws_instance" "ec2_example" {
    ami = "ami-06b09bfacae1453cb"
    instance_type = "t2.micro"
    tags = {
      Name = "EC2 Instance with remote state"
    }
}

terraform {
    backend "s3" {
        bucket = "dhruv-terraform-s3-bucket"
        key    = "terraform.tfstate"
        region     = "us-east-1"
       dynamodb_table  = "dynamodb-state-locking"
    }
} 
