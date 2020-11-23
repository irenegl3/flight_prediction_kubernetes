#!/bin/bash

pyhton3 update-kafka.py
./bin/kafka-server-start.sh config/server.properties 