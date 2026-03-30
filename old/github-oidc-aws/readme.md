## IRSA for k8s to create the load balancer

    create the iam identity provider for you cluster
    download the iam policy

curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.11.0/docs/install/iam_policy.json aws iam create-policy
--policy-name AWSLoadBalancerControllerIAMPolicy
--policy-document file://iam_policy.json

    copy the arn for oidc id provider

arn:aws:iam::879381241087:oidc-provider/oidc.eks.ap-south-1.amazonaws.com/id/BAF6AF3D227043D5C3AA23E5E39C72EB

-> export cluster_name=demo-akhilesh oidc_id=$(aws eks describe-cluster --name $cluster_name
--query "cluster.identity.oidc.issuer" --output text | cut -d '/' -f 5)

echo $oidc_id