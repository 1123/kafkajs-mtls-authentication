kubectl apply -f connect-bootstrap-service.yaml
kubectl apply -f ksqldb-bootstrap-service.yaml
kubectl apply -f mds-bootstrap-service.yaml

kubectl apply -f ingress-service-hostbased.yaml

