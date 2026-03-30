#ON AWS SIDE
# Create IAM identity provide for github --> aws IAM


# OIDC provider
resource "aws_iam_openid_connect_provider" "github_actions" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = [
    "9e99f0c5b5b5b5b5b5b5b5b5b5b5b5b5b5b5b5b5"
  ]

  tags = {
    Name        = "github-actions-OIDC-provider"
  }
}


# IAM Role

resource "aws_iam_role" "github_actions_eks_build_role" {
  name = "eks-github-actions-build-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github_actions.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:sub" : "repo:Evatee-coder/part5-github-oidc-aws:ref:refs/heads/main",
            "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com"
          }
        }
      }
    ]
  })

  tags = {
    Name = "GitHub-Actions-EKS-Deploy-Role"
  }
}


resource "aws_iam_role_policy_attachment" "attach_ecr_policy" {
  role       = aws_iam_role.github_actions_eks_build_role.name
  policy_arn = aws_iam_policy.ecr_push_pull_policy.arn
}


# Create IAM policy that allow users to talk to ecr
# Create IAM role that allow the web identity to assume this role and attach the IAM policy for ECR to this role.


#ON GITHUB SIDE
# Use that role instead of key