keytool \
  -keystore kafka.client.truststore.jks \
  -alias CARoot \
  -importcert \
  -trustcacerts \
  -file externalCacerts.pem
