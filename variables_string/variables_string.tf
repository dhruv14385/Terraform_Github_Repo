//There are 3 resources in this block. By using variable, we can update tag of all of them at once. 

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

resource "aws_instance" "web1" {

   ami           = "ami-0a3c3a20c09d6f377"
   instance_type =  "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

resource "aws_instance" "web2" {

  ami           = "ami-0a3c3a20c09d6f377"
  instance_type =  "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

resource "aws_instance" "web3" {

  ami           = "ami-0a3c3a20c09d6f377"
  instance_type =  "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

