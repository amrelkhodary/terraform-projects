#generate the IAM users specified
resource "aws_iam_user" "iam-users" {
    for_each = toset(var.usernames)
    name = each.value
    force_destroy = true
}


#generate a login profile for every user
resource "aws_iam_user_login_profile" "user_profiles" {
  for_each = toset(var.usernames)
  
  user                    = aws_iam_user.iam-users[each.value].name
  password_reset_required = var.force_password_reset
}

# Attach all users to the specified group
resource "aws_iam_group_membership" "user_group_membership" {
  name  = "${var.group-name}-membership"
  group = var.group-name
  users = [for user in aws_iam_user.iam-users : user.name]
}