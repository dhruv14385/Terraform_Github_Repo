//This file will create 3 IAM users using count. 

resource "aws_iam_user" "example" {
  count = length(var.user_names)            //=3
  name  = var.user_names[count.index]
}

variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}
