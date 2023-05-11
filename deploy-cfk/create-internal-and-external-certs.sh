#!/bin/bash

set -u -e

openssl genrsa -out ca-key.pem 2048

openssl req -new -key ca-key.pem -x509 \
  -days 1000 \
  -out ca.pem \
  -subj "/C=US/ST=CA/L=MountainView/O=Confluent/OU=Operator/CN=TestCA"


kubectl create secret tls ca-pair-sslcerts \
  --cert=ca.pem \
  --key=ca-key.pem -n confluent


openssl genrsa -out externalRootCAkey.pem 2048

openssl req -x509  -new -nodes \
  -key externalRootCAkey.pem \
  -days 3650 \
  -out externalCacerts.pem \
  -subj "/C=US/ST=CA/L=MVT/O=TestOrg/OU=Cloud/CN=TestCA"

# Create Kafka server certificates
cfssl gencert \
  -ca=externalCacerts.pem \
  -ca-key=externalRootCAkey.pem \
  -config=ca-config.json \
  -profile=server kafka-server-domain.json | cfssljson -bare kafka-server

kubectl create secret generic tls-kafka \
  --from-file=fullchain.pem=kafka-server.pem \
  --from-file=cacerts.pem=externalCacerts.pem \
  --from-file=privkey.pem=kafka-server-key.pem \
  --namespace confluent


