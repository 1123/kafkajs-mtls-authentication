kubectl create secret generic credential \
  --from-file=basic.txt=creds-control-center-users.txt \
  --from-file=ldap.txt=ldap.txt \
  --namespace confluent
