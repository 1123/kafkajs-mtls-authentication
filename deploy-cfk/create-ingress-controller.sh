cfssl gencert -ca=externalCacerts.pem \
-ca-key=externalRootCAkey.pem \
-config=ca-config.json \
-profile=server ingress-server-domain.json | cfssljson -bare ingress-server

kubectl create secret tls tls-nginx-cert \
  --cert=ingress-server.pem \
  --key=ingress-server-key.pem \
  --namespace confluent
