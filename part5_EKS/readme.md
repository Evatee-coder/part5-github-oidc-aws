# add kube config on local

aws eks update-kubeconfig --name eks-cluster-part5-3rdjan

kubectl config current-context

kubectl config rename-context arn:................ <newName>

kubectl config current-context


# How to run workload on fargate
- create a namespace on cluster
- create fargate profile and provide the namespace
- run the pod on that name space


# load balancer controller install

# helm install
I already have this

# helm repo add
add the command below in part5 root
helm repo add eks https://aws.github.io/eks-charts

# helm update
help repo update

# Install aws load balancer controller

helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
-n kube-system \
--set clusterName=eks-cluster-part5-3rdjan \
--set serviceAccount.create=false \
--set serviceAccount.name=aws-load-balancer-controller \
--set vpcId=vpc-0343ca1e0aa1fa000 \
--set region=us-east-1


