# For POC purposes using a single service account identity ==========================================
data "aws_iam_user" "POCServiceAccount" {
  user_name = "POCServiceAccount"
}

module "POCServiceAccountGroup" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy"
  version = "5.30.0"

  count           = var.is_state_account ? 1 : 0
  name            = "POCServiceAccountGroup"
  assumable_roles = var.all_account_roles

  group_users = [
    data.aws_iam_user.POCServiceAccount.user_name
  ]
}
