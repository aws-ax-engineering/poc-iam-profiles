# POCTerraformRole
#
# Used by: poc platform-team terraform pipelines


#locals {
#  trusted_role_arns = var.prod_cluster ? ["arn:aws:iam::${var.state_account_id}:root", "arn:aws:iam::${var.aws_account_id}:root"] : ["arn:aws:iam::${var.state_account_id}:root"]
#}

module "POCTerraformRole" {
  source      = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version     = "5.30.0"
  create_role = true

  role_name                         = "POCTerraformRole"
  role_requires_mfa                 = false
  custom_role_policy_arns           = [aws_iam_policy.POCTerraformRolePolicy.arn]
  number_of_custom_role_policy_arns = 1

  trusted_role_arns = [
    "arn:aws:iam::${var.state_account_id}:root",
    "arn:aws:iam::599654392735:role/mapi-i01-aws-us-east-2-argocd-server-sa"
  ]
}

# role permissions
#tfsec:ignore:aws-iam-no-policy-wildcards
resource "aws_iam_policy" "POCTerraformRolePolicy" {
  name = "POCTerraformRolePolicys"

  policy = jsonencode({
    "Version" : "2012-10-17"
    "Statement" : [
      {
        "Action" : [
          "*"
        ]
        "Effect" : "Allow"
        "Resource" : "*"
      },
    ]
  })
}

