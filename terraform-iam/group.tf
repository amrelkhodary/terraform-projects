#submodule to create a new group and attach IAM policies to it

#fetching required IAM policies
data "aws_iam_policy" "vpc_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

data "aws_iam_policy" "ec2_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

data "aws_iam_policy" "iam_readonly" {
  arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
}

data "aws_iam_policy" "elb_full_access" {
  arn = "arn:aws:iam::aws:policy/ElasticLoadBalancingFullAccess"
}

data "aws_iam_policy" "autoscaling_full_access" {
  arn = "arn:aws:iam::aws:policy/AutoScalingFullAccess"
}

#creating a new group (might return an error if the group already exists)
resource "aws_iam_group" "users" {
    name = var.group-name 
}

#attaching the policies to the group
resource "aws_iam_policy_attachment" "group_vpc_full_access" {
    name = "group-vpc-full-access-attachment"
    policy_arn = data.aws_iam_policy.vpc_full_access.arn
    groups = [aws_iam_group.users.name]
}

resource "aws_iam_policy_attachment" "group_ec2_full_access" {
    name = "group-ec2-full-access-attachment"
    policy_arn = data.aws_iam_policy.ec2_full_access.arn
    groups = [aws_iam_group.users.name]
}

resource "aws_iam_policy_attachment" "group_iam_read_only" {
    name = "group-iam-read-only-attachment"
    policy_arn = data.aws_iam_policy.iam_readonly.arn
    groups = [aws_iam_group.users.name]
}

resource "aws_iam_policy_attachment" "group_elb_full_access" {
    name = "group-elb-full-access-attachment"
    policy_arn = data.aws_iam_policy.elb_full_access.arn
    groups = [aws_iam_group.users.name]
}

resource "aws_iam_policy_attachment" "group_asg_full_access" {
    name = "group-asg-full-access-attachment"
    policy_arn = data.aws_iam_policy.autoscaling_full_access.arn
    groups = [aws_iam_group.users.name]
}