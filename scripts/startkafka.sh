#!/bin/bash

cd kafka_2.12-2.3.0

./bin/kafka-topics.sh \
    --create \
    --zookeeper localhost:2181 \
    --replication-factor 1 \
    --partitions 1 \
    --topic flight_delay_classification_request

./bin/kafka-server-start.sh config/server.properties