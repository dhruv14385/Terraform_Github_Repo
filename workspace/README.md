terraform workspace new dev      //to create new workspace and switch to it
terraform workspace list         //to see list of all the workspaces. active workspace will have * in front of it.
terraform workspace select test  //to switch to test workspace 
Create separate tfvars file for each workspace and provide it as argument during plan and apply i.e.,
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
