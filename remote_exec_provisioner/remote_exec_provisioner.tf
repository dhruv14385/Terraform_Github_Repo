//This file will create an ec2 instance and a text file in that ec2 instance. 

provider "aws" {
  region = "us-east-1"
}

//terraform uses this key to create text file in ec2 instance
resource "aws_key_pair" "deployer" {             
  key_name   = "id_rsa"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCrKwk1ij4ccmmlQKSyun92iT3Jv4x0NjU+3pnulEHv8HjmmzihfjBrYsNWCy067gsDYR0KJgGnp6RNqXGjmnv70cfVC5IgjWf0lxOGqQs0+cP8YodE2IOuRUOqkImRKGHKWKUfT06ef4dwYHsXJxtzIB64Ylu3WHav4Mj/ZGgiB2vdlMOa2QssprjLXWpBtn++2Y6n0URRVaGUUZcsAMOS1WDRmn7fR6vwd0nC2miDyPvcw+NEbDbtxcxfdnWiYYqEb5egET/SXDN8D0brYuJe/3dMQZChB1r4ziOky0SRPw4MkhVttJ/rqMQw6GGiiRWW3kkPA5HxKH7nyDZDFf3PuNK24mPhtHnQdQ6y+NEbDJuivXpj+zIMGbG4ipE0HyTbZtcdSGM32T7fBrrXgg9j5LrcRUrOdPifVUEHuj3toku1f3ZqSLIl4PNkV4la9WtyO5exwSbssoz+KEADa7TV6HGQh5cKtO8KT1rkteZHrIIz6sTMxy9/JDXQ7/wFza7nuFuzfHpXBEVC8ScWR4Nwdn6iyx7/7e4Dk/MIFqbA1inYiMMu4ckjHh/lrwIntWA5pXDmxIA8ydu6tdzc5brsC6NCdgnostDAJjB74Y/3oPLAQvPPSfVeNU/VArzciJgFdYjvSMLYPAEX24RE07Tl4QwPffIM65UJCX3oaNwSWQ== dhruv14385@gmail.com"
}

resource "aws_instance" "web" {

  ami           = "ami-06b09bfacae1453cb"
  instance_type = "t2.micro"
  key_name= "id_rsa"
  vpc_security_group_ids = [aws_security_group.main.id]

  tags = {
    Name = "Provisioner - Tutorial"
  }

  provisioner "remote-exec" {
    inline = [
    "touch sample_file.txt",
    "echo helloworld remote provisioner >> sample_file.txt",
    ]
  }

  //connection block is required so that we can ssh into ec2 from local machine to check if the file ic created or not
  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = "${file("C:/Users/Dhruv/.ssh/id_rsa")}"     //please note how to specify filepath for windows OS
      timeout     = "4m"
   }
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}