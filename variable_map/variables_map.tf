//This example creates an EC2 instance with environment and project as Key and 
// dev and project-alpha as their Value respectively. 

resource "aws_instance" "ec2_example" {

   ami           = "ami-0a3c3a20c09d6f377"
   instance_type =  "t2.micro"
   tags = var.project_environment
}

variable "project_environment" {
  description = "project name and environment"
  type        = map(string)
  default     = {
    project     = "project-alpha",      //Key-Value
    environment = "dev"
  }
  }
