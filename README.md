# part5-github-oidc-aws
oidc for githu + ingress and load balancer for 2-tier app


dns check
kubectl run -it --rm --restart=Never dns-test --image=gcr.io/kubernetes-e2e-test-images/dnsutils:1.3 \
-- dig devopsdojo-db-service.devopsdojo.svc.cluster.local



psql -h host -d postgres -U postgres
host can be seen in freelens--config--secrets--DB_url(click the eye) and you will see the link below.
host is copied from @ to .com
postgresql://postgres:LK4MdTIdgi@bootcampclass5-dev-devopsdojo.cgh22wq6k3xy.us-east-1.rds.amazonaws.com:5432/postgres

-d db
-U username
password: LK4MdTIdgi

psql -h bootcampclass5-dev-devopsdojo.cgh22wq6k3xy.us-east-1.rds.amazonaws.com -d postgres -U postgres




