//This file contains only resource block. 

resource "aws_instance" "web1" {

   ami           = "ami-0a3c3a20c09d6f377"
   instance_type =  var.instance_type 

  tags = {
    Name = var.environment_name
  }
}