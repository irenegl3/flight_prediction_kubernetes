#!/bin/bash

./bin/kafka-topics.sh \
    --create \
    --zookeeper 35.246.2.118:30181 \
    --replication-factor 1 \
    --partitions 1 \
    --topic flight_delay_classification_request 