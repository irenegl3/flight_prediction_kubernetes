#!/bin/bash

python3 ../scripts/update-kafka.py &
sleep 5
./bin/kafka-server-start.sh config/server.properties &
sleep 15 &
./bin/kafka-topics.sh \
    --create \
    --zookeeper 10.31.242.67:30181 \
    --replication-factor 1 \
    --partitions 1 \
    --topic flight_delay_classification_request 
