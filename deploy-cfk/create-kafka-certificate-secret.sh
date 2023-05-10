kubectl create secret generic tls-kafka \
  --from-file=fullchain.pem=kafka-server.pem \
  --from-file=cacerts.pem=externalCacerts.pem \
  --from-file=privkey.pem=kafka-server-key.pem \
  --namespace confluent
