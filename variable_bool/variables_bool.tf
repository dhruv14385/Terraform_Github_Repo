//In this example, by changing the variable, we can assign or not assign public IP to all EC2 at once. 

variable "enable_public_ip" {
  description = "Enable public IP address"
  type        = bool
  default     = true
}

resource "aws_instance" "ec2_example" {
   ami           = "ami-0a3c3a20c09d6f377"
   instance_type =  "t2.micro"
   subnet_id     =  "subnet-014dc18af2dbff751"     //choose a subnet which doesn't auto-assign IPv4 
   associate_public_ip_address = var.enable_public_ip
}

resource "aws_instance" "ec2_example1" {
   ami           = "ami-0a3c3a20c09d6f377"      
   instance_type =  "t2.micro"                   
   subnet_id     =  "subnet-014dc18af2dbff751"     //choose a subnet which doesn't auto-assign IPv4
   associate_public_ip_address = var.enable_public_ip
}

resource "aws_instance" "ec2_example2" {
   ami           = "ami-0a3c3a20c09d6f377"      
   instance_type =  "t2.micro"                  
   subnet_id     =  "subnet-014dc18af2dbff751"     //choose a subnet which doesn't auto-assign IPv4
   associate_public_ip_address = var.enable_public_ip
}