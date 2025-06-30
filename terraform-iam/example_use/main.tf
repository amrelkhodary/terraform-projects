module "iam-group-module" {
    source = "../../terraform-iam"
    usernames = ["first-user", "second-user"]
    region = "us-west-1"
    group-name = "my-group"
}
