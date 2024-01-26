//This file will create 3 IAM users using count. 

resource "aws_instance" "ec2_example" {

   ami           = "ami-0a3c3a20c09d6f377"
   instance_type =  "t2.micro"

   tags = {
        Name = "Terraform EC2"
   }

}

resource "aws_iam_user" "example" {
  count = length(var.user_names)            //=3
  name  = var.user_names[count.index]
}

variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}
