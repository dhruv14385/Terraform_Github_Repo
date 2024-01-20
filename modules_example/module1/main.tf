//this is Module1

provider "aws" {
  region     = "us-east-1"
}

variable "enable_imdsv2" {        //this is required for metadata
    type = bool
    default = true  # Optional by default
    }

resource "aws_instance" "ec2_example" {
    ami = "ami-0df435f331839b2d6"
    instance_type = "t2.micro"
    key_name= "dhruv2024"
    vpc_security_group_ids = [aws_security_group.main.id]
    
    metadata_options {            //this is required for metadata
    http_endpoint = var.enable_imdsv2 ? "enabled" : "disabled"
    http_tokens = "optional"
    }    

  user_data = <<-EOF
      #!/bin/sh
      sudo yum update -y
      sudo yum install httpd -y
      sudo systemctl start httpd
      sudo systemctl enable httpd
      sudo systemctl status httpd
      sudo chown -R $USER:$USER /var/www/html
      sudo echo "<html><body><h1>Hello this is module-1 at instance id `curl http://169.254.169.254/latest/meta-data/instance-id` </h1></body></html>" > /var/www/html/index.html
      EOF
}

resource "aws_security_group" "main" {
    name        = "EC2-webserver-SG-1"
  description = "Webserver for EC2 Instances"

  ingress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}



