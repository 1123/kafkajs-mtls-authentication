const { Kafka } = require('kafkajs')
const fs = require('fs');


const kafka = new Kafka({
  clientId: 'my-app',
  brokers: ['kafka.mydomain.com:9092'],
  // authenticationTimeout: 10000,
  // reauthenticationThreshold: 10000,
  ssl: {
    rejectUnauthorized: false,
    ca: [
         fs.readFileSync('deploy-cfk/externalCacerts.pem', 'utf-8')
    ],
    key: fs.readFileSync('deploy-cfk/kafka-client-key.pem', 'utf-8'),
    //key: fs.readFileSync('deploy-cfk/client-key.pem', 'utf-8'),
    cert: fs.readFileSync('deploy-cfk/kafka-client.pem', 'utf-8'),
  },
})

const producer = kafka.producer()
const consumer = kafka.consumer({ groupId: 'test-group' })

const run = async () => {
  // Producing
  await producer.connect()
  await producer.send({
    topic: 'test',
    messages: [
      { value: 'Hello KafkaJS user!' },
    ],
  })

  // Consuming
  await consumer.connect()
  await consumer.subscribe({ topic: 'test', fromBeginning: true })

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
