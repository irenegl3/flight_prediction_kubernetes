#!/bin/bash

mongod --bind_ip_all &
./resources/import_distances.sh &
sleep 1234567
