In this folder, there are multiple files.
main.tf file contains only resource block.
variable.tf file contains only variable definition.
stage.tfvars and production.tfvars files contain different values of the variables defined in variable.tf
When we need to use values of stage.tfvars file, we can supply it using 
terraform plan -var-file="stage.tfvars" and then
terraform apply -var-file="stage.tfvars"
