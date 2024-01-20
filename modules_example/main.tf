provider "aws" {
   region     = us-east-1   
}

module "module1" {
  source = ".//module1"
}

module "module2" {
  source = ".//module2"
}
