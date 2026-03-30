terraform {
  required_version = ">= 1.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.0.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
  }
}

terraform {
  backend "s3" {
    bucket  = "state-bucket-216989097838"
    key     = " /dev/eksBootieDec25/Part6EKSinfra/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    # assume_role = {
    #   role_arn = "arn:aws:iam::123456789012:role/your-assume-role"
    # }
  }
}

