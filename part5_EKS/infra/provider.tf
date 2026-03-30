provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      class = "eks-5-3rd-jan"
    }
  }

}

# # aws provider alias for different regions
# provider "aws" {
#     alias  = "us-west-2"
#     region = "us-west-2"
# }

# provider "aws" {
#   alias  = "us-east-2"
#   region = "us-east-2"
# }



# The kubernetes provider to interact with EKS cluster. 
# It must be used after creating EKS cluster.

# provider "kubernetes" {
#   host                   = data.aws_eks_cluster.eks.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
#   token                  = data.aws_eks_cluster_auth.cluster.token
# }