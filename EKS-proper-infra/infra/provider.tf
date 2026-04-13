#OLD CODE works fine but give error while trying to destroy terraform 
# I had to uncomment it given we are making old code dynamics in Class11-12 of Akhilesh
# Part 9-10 for me

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


data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_name
  depends_on = [
    module.eks
  ]
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
  depends_on = [
    module.eks
  ]
}



provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

# Configure Helm Provider
provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}




## New code I adjusted when I was trying to destroy terraform and it was giving error related to provider configuration. I have added the provider configuration with the same region as the one I am using for creating the EKS cluster. This should help in destroying the resources without any issues.

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

# provider "kubernetes" {
#   host                   = module.eks.cluster_endpoint
#   cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

#   exec {
#     api_version = "client.authentication.k8s.io/v1beta1"
#     command     = "aws"
#     args = [
#       "eks",
#       "get-token",
#       "--cluster-name",
#       module.eks.cluster_name,
#       "--region",
#       "us-east-1"
#     ]
#   }
# }

# provider "helm" {
#   kubernetes {
#     host                   = module.eks.cluster_endpoint
#     cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

#     exec {
#       api_version = "client.authentication.k8s.io/v1beta1"
#       command     = "aws"
#       args = [
#         "eks",
#         "get-token",
#         "--cluster-name",
#         module.eks.cluster_name,
#         "--region",
#         "us-east-1"
#       ]
#     }
#   }
# }