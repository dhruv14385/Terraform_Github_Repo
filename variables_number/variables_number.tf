//In this example, by changing variable value, we can change number of resources to be created all at once.

variable "instance_count" {
  description = "EC2 instance count"
  type        = number
  default     = 2

  validation{                                   //optional
   condition = var.instance_count <= 4
   error_message = "Must be less than 5."
  }
}

resource "aws_instance" "ec2_example" {
   ami           = "ami-0a3c3a20c09d6f377"
   instance_type =  "t2.micro"
   count = var.instance_count
}

resource "aws_instance" "ec2_example1" {
   ami           = "ami-0a3c3a20c09d6f377"
   instance_type =  "t2.micro"
   count = var.instance_count
}

resource "aws_instance" "ec2_example2" {
   ami           = "ami-0a3c3a20c09d6f377"
   instance_type =  "t2.micro"
   count = var.instance_count
}

