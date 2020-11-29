#!/bin/bash

python3 resources/train_spark_mllib_model.py . &

# ejecutar master y worker de spark para prediccion
./spark-2.4.4-bin-hadoop2.7/bin/spark-submit \
  --class es.upm.dit.ging.predictor.MakePrediction \
  --packages org.mongodb.spark:mongo-spark-connector_2.11:2.3.2,org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.0 \
  /main/flight_prediction/target/scala-2.11/flight_prediction_2.11-0.1.jar 
