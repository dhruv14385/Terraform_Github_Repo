//This file will output usernames using for loop

variable "user_names" {
  description = "IAM usernames"
  type        = set(string)
  default     = ["user1", "user2", "user3"]
}

output "Print_the_names"{
    value = [for name in var.user_names : name]
}
