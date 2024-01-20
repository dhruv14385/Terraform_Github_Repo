resource "aws_security_group" "main" {
   name   = "resource_with_dynamic_block"
   //vpc_id = data.aws_vpc.main.id

    //Please note that dynamic block has to be within resource block
    dynamic "ingress" {
      for_each = local.ingress_rules      //look at locals defined below

      content {      //this is the section which will be repeated for port 443 and 80
         description = ingress.value.description
         from_port   = ingress.value.port
         to_port     = ingress.value.port
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
      }
   }
}

locals {
   ingress_rules = [{
      port        = 443
      description = "Ingress rules for port 443"
   },
   {
      port        = 80
      description = "Ingress rules for port 80"
   }]
}



provider "aws" {
  region     = "us-east-1"
  }