module "iam-group-module" {
    source = "../../terraform-iam"
    usernames = ["first-user", "second-user"]
    group-name = "my-group"
}
