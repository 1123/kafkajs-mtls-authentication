for s in c3-mds-client ca-key-pair ca-pair-sslcerts connect-mds-client \
  credential kafka-client-config ksqldb-mds-client mds-client mds-token \
  rest-credential sr-mds-client tls-kafka; do \
    kubectl delete secret $s
done
