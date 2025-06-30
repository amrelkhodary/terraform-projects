# Submodule to create a new group and attach IAM policies to it

# Creating a new group (might return an error if the group already exists)
resource "aws_iam_group" "users" {
    name = var.group-name 
}

# Attaching the policies to the group using direct ARN references
resource "aws_iam_policy_attachment" "group_vpc_full_access" {
    name       = "group-vpc-full-access-attachment"
    policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
    groups     = [aws_iam_group.users.name]
}

resource "aws_iam_policy_attachment" "group_ec2_full_access" {
    name       = "group-ec2-full-access-attachment"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
    groups     = [aws_iam_group.users.name]
}

resource "aws_iam_policy_attachment" "group_iam_read_only" {
    name       = "group-iam-read-only-attachment"
    policy_arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
    groups     = [aws_iam_group.users.name]
}

resource "aws_iam_policy_attachment" "group_elb_full_access" {
    name       = "group-elb-full-access-attachment"
    policy_arn = "arn:aws:iam::aws:policy/ElasticLoadBalancingFullAccess"
    groups     = [aws_iam_group.users.name]
}

resource "aws_iam_policy_attachment" "group_asg_full_access" {
    name       = "group-asg-full-access-attachment"
    policy_arn = "arn:aws:iam::aws:policy/AutoScalingFullAccess"
    groups     = [aws_iam_group.users.name]
}