

locals {
  instance_name = "${terraform.workspace}-instance" 
}

variable "instance_type" {
    type = string
}

resource "aws_instance" "ec2_example" {

    ami = "ami-0a3c3a20c09d6f377" 

    instance_type = var.instance_type

    tags = {
      Name = local.instance_name
    }
}
