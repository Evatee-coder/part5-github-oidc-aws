terraform {
  required_version = "1.13.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

terraform {
    backend "s3" {
  bucket  = "state-bucket-216989097838"
  key     = "part5-github-oidc-aws/github-oidc-aws/terraform.tfstate" #repoName/projectNameORfoldername/terraform.tfstate
  region  = "us-east-1"
  encrypt = true
}
}


provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project = "github-oidc-aws"
      class   = "21December"
      repo    = "part5-github-oidc-aws/github-oidc-aws" #helps to identify the repo from which this infrastructure is created
    }
  }
}







