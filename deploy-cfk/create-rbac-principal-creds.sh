kubectl create secret generic mds-token \
  --from-file=mdsPublicKey.pem=mds-publickey.txt \
  --from-file=mdsTokenKeyPair.pem=mds-tokenkeypair.txt \
  --namespace confluent

# Kafka RBAC credential
kubectl create secret generic mds-client \
  --from-file=bearer.txt=kafka-client.txt \
  --namespace confluent
# Control Center RBAC credential
kubectl create secret generic c3-mds-client \
  --from-file=bearer.txt=c3-mds-client.txt \
  --namespace confluent
# Connect RBAC credential
kubectl create secret generic connect-mds-client \
  --from-file=bearer.txt=connect-mds-client.txt \
  --namespace confluent
# Schema Registry RBAC credential
kubectl create secret generic sr-mds-client \
  --from-file=bearer.txt=sr-mds-client.txt \
  --namespace confluent
# ksqlDB RBAC credential
kubectl create secret generic ksqldb-mds-client \
  --from-file=bearer.txt=ksqldb-mds-client.txt \
  --namespace confluent
# Kafka REST credential
kubectl create secret generic rest-credential \
  --from-file=bearer.txt=kafka-client.txt \
  --from-file=basic.txt=kafka-client.txt \
  --namespace confluent
