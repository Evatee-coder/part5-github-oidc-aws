provider "aws" {
  region = "us-east-1"
  # assume_role {
  #   role_arn     = "arn:aws:iam::123456789012:role/your-assume-role"
  # }
  default_tags {
    tags = {
      class = "eks-5-3rd-jan"
    }
  }
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      module.eks.cluster_name,
      "--region",
      "us-east-1"
    ]
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args = [
        "eks",
        "get-token",
        "--cluster-name",
        module.eks.cluster_name,
        "--region",
        "us-east-1"
      ]
    }
  }
}






#OLD CODE works fine but give error while trying to destroy terraform 


# provider "aws" {
#   region = "us-east-1"
#   # assume_role {
#   #   role_arn     = "arn:aws:iam::123456789012:role/your-assume-role"
#   # }
#   default_tags {
#     tags = {
#       class = "eks-5-3rd-jan"
#     }
#   }

# }


# data "aws_eks_cluster" "eks" {
#   name = module.eks.cluster_name
#   depends_on = [
#     module.eks
#   ]
# }

# data "aws_eks_cluster_auth" "cluster" {
#   name = module.eks.cluster_name
#   depends_on = [
#     module.eks
#   ]
# }



# provider "kubernetes" {
#   host                   = module.eks.cluster_endpoint
#   cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
#   token                  = data.aws_eks_cluster_auth.cluster.token
# }

# # Configure Helm Provider
# provider "helm" {
#   kubernetes {
#     host                   = module.eks.cluster_endpoint
#     cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
#     token                  = data.aws_eks_cluster_auth.cluster.token
#   }
# }