#not really necessary for our module since IAM is a global service, but used anyways for making the code clean
variable "region" {
    type = string
    default = "us-east-1"
}

variable "group-name" {
    type = string
    default = "users"
}

variable "usernames" {
    type = list(string)
    description = "List of usersnames for new users to create."
}

variable "force_password_reset" {
  description = "Force users to reset password on first login"
  type        = bool
  default     = true
}