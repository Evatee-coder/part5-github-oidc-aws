resource "aws_iam_role_policy" "github_actions_s3_state" {
  name = "s3-state-inline-policy"
  role = "eks-github-actions-build-role"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket",
          "s3:GetBucketVersioning",
          "s3:GetBucketAcl",
          "s3:GetBucketLocation"
        ]
        Resource = [
          "arn:aws:s3:::state-bucket-216989097838",
          "arn:aws:s3:::state-bucket-216989097838/*"
        ]
      }
    ]
  })
}