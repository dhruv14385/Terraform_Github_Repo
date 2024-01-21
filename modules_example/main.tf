//This file will execute 2 modules which are saved in other folders.
//Each module creates an ec2 instance with a security group and also installs apache server.
//After all the resources are created, you can open public ip of ec2 instance in a browser and check that apache is installed correctly. 

provider "aws" {
   region     = us-east-1   
}

module "module1" {
  source = ".//module1"
}

module "module2" {
  source = ".//module2"
}
