#!/bin/bash

set -u -e

# Create client certificate
cfssl gencert \
  -ca=externalCacerts.pem \
  -ca-key=externalRootCAkey.pem \
  -config=ca-config.json \
  -profile=client kafka-server-domain.json | cfssljson -bare kafka-client


