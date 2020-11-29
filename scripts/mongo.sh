#!/bin/bash

mongod &
./resources/import_distances.sh &
sleep 1234567
