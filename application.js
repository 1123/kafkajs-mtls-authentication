const { Kafka } = require('kafkajs')


const kafka = new Kafka({
  clientId: 'my-app',
  brokers: ['pkc-75m1o.europe-west3.gcp.confluent.cloud:9092'],
  // authenticationTimeout: 10000,
  // reauthenticationThreshold: 10000,
  ssl: true,
  sasl: {
    mechanism: 'plain', // scram-sha-256 or scram-sha-512
    username: 'I6YIQ2KKRZBJRR3B',
    password: 'uEVfFo2DONBGZzQxRhbza0OwIH0n3h2zafrSzViUE9rXtWxKPnTu/55gYDeJnIY7'
  },
})

const producer = kafka.producer()
const consumer = kafka.consumer({ groupId: 'test-group' })

const run = async () => {
  // Producing
  await producer.connect()
  await producer.send({
    topic: 'test-topic',
    messages: [
      { value: 'Hello KafkaJS user!' },
    ],
  })

  // Consuming
  await consumer.connect()
  await consumer.subscribe({ topic: 'test-topic', fromBeginning: true })

  await consumer.run({
    eachMessage: async ({ topic, partition, message }) => {
      console.log({
        partition,
        offset: message.offset,
        value: message.value.toString(),
      })
    },
  })
}

run().catch(console.error)
