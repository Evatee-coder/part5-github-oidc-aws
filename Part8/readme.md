kubectl set image deployment <deployment-name> <container-name> = <new-image>:<tag>
kubectl rollout status deployment

kubectl rollout undo deployment

    install minikube, start and all

    install argocd

# ArgoCD on Minikube
 ## Start Minikube

minikube start

Install ArgoCD

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Wait for Pods

kubectl wait --for=condition=Ready pods --all -n argocd --timeout=300s

# Get Initial Admin Password

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

# Access ArgoCD UI (Port Forward)

kubectl port-forward svc/argocd-server -n argocd 8080:443

Access at: https://localhost:8080

    Username: admin
    Password: (from step above)

# Alternative: Access via NodePort

kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'
minikube service argocd-server -n argocd

# Login via CLI

argocd login localhost:8080 --username admin --password <password> --insecure

# Change Admin Password (Optional)

argocd account update-password