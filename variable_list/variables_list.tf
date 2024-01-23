//This configuration file creates 3 IAM users using list variables. 

resource "aws_iam_user" "example" {
  count = length(var.user_names)          //It counts number of variables in the list.
                                          //So we don't have to repeat resource block 3 times.
  name  = var.user_names[count.index]     //This is how you name each IAM user. 
}

variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}

