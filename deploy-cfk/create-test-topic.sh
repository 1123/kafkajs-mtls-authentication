kafka-topics \
  --create \
  --topic test \
  --partitions 6 \
  --replication-factor 3 \
  --command-config producer.properties \
  --bootstrap-server kafka.mydomain.com:9092
