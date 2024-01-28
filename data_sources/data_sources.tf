//Data sources are used when you want to get some information out of the resources
// like public IP, private IP of and EC2 instance.

resource "aws_instance" "ec2_example" {

    ami           = "ami-0a3c3a20c09d6f377"
    instance_type =  "t2.micro"

    tags = {
      Name = "Terraform EC2"
    }
}

data "aws_instance" "myawsinstance" {
    filter {
        name = "tag:Name"
        values = ["Terraform EC2"]
    }

    depends_on = [
      "aws_instance.ec2_example"
    ]
}

output "fetched_info_from_aws" {
  value = data.aws_instance.myawsinstance.public_ip
}
