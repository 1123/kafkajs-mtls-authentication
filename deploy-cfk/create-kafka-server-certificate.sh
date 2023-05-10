openssl genrsa -out externalRootCAkey.pem 2048

openssl req -x509  -new -nodes \
  -key externalRootCAkey.pem \
  -days 3650 \
  -out externalCacerts.pem \
  -subj "/C=US/ST=CA/L=MVT/O=TestOrg/OU=Cloud/CN=TestCA"

# Create Kafka server certificates
cfssl gencert -ca=externalCacerts.pem \
-ca-key=externalRootCAkey.pem \
-config=ca-config.json \
-profile=server kafka-server-domain.json | cfssljson -bare kafka-server
