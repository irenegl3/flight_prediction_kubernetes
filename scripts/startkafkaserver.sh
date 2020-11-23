#!/bin/bash

python3 ../scripts/update-kafka.py
./bin/kafka-server-start.sh config/server.properties 