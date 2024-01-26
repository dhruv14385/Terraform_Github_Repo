resource "aws_instance" "web" {

  ami           = "ami-06b09bfacae1453cb"
  instance_type = "t2.micro"

   tags = {
     Name = "output_EC2"
   }
}

output "simple_output"{
    value = "This is non-sensitive output."
}

output "sensitive_output"{
    value = "This is sensitive output."     //Value will not be displayed. 
    sensitive = true
}
