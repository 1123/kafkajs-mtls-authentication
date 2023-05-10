openssl s_client -connect kafka.mydomain.com:9092 2>/dev/null | openssl x509 -text -noout
