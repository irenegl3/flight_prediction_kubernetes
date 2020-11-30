# Predicción de retraso de vuelos con kubernetes

Proyecto inicial obtenido del repositorio https://github.com/ging/practica_big_data_2019, basado en https://github.com/rjurney/Agile_Data_Code_2 .

Se trata de la implementación de un sistema completo que usa un modelo predictivo, también creado por el sistema, para realizar predicciones en tiempo real de nuevos vuelos.

## Tecnologías empleadas
- Mongo versión 4.4.2
- Flask
- Kafka versión 2.12-2.3.0
- Zookeper versión 3.5.5
- Spark versión 2.4.4
- SBT
- Python3
- PIP
- Kubernetes
- Google Cloud

## Arquitectura
[<img src="images/video_course_cover.png">](http://datasyndrome.com/video)

## Proceso

1. Descargar el dataset con la información de vuelos y sus retrasos, con el fin de entrenar el modelo de Machine Learning. Este paso se ha realizado previamente, y los datos obtenidos se encuentran en la carpeta **data**. Se han almacenado dichos datos en la base de datos mongo.

2. Crear el flujo de comunicación que permitirá el envío de datos desde el job de Spark con el servidor web de Flask. Para ello se ha empleado Zookeeper y Kafka, y se ha creado un topic al que se suscribirá el job de Spark.

2. Entrenar el modelo predictivo empleando el algoritmo RandomForest con los datos obtenidos. Para ello se ha empleado PySpark.

3. Ejecutar el job de Spark que predice el retraso del vuelo indicado por el usuario. Para ello se ha empleado spark-submit, que ejecuta el fichero jar que contiene la clase de Scala que realiza las funciones necesarias, entre las que se encuentra generar un *stream* de comunicación subscribiéndose al topic de Kafka (paso 2) para consumir sus datos, y conectarse a la base de datos mongo para insertar las predicciones hechas.

4. Servidor web de Flask donde el usuario podrá seleccionar que vuelo quiere predecir y podrá ver el resultado de la predicción. Este componente envía, mediante Kafka, la información solicitada por el usuario, para que el job de Spark la consuma y genere la predicción correspondiente. Gracias al continuo *polling* que flask hace a Mongo, puede consultar los resultados de la predicción y mostrarlos en la interfaz web.

## Implementación
En este proyecto se han realizado las siguientes implementaciones a parte del funcionamiento básico (4 puntos):
- Spark-submit para ejecutar el job de predicción, en lugar de usar IntelliJ como que se propone inicialmente en el enunciado (1 punto)
- Dockerizar cada servicio por separado, generando contenedores distintos para Zookeeper, Kafka, Mongo, Spark y WebServer (1 punto)
- Despliegue de los servicios dockerizados mediante kubernetes, haciendo uso de los ficheros en la carpeta kubernetes del repositorio (2 puntos)
- Despliegue de todo el sistema en la plataforma Google Cloud (1 punto)

* El despliegue de servicios con docker-compose se ha realizado también (1 puntos) y para poder ejecutarlo se debe ir al siguiente repositorio: https://github.com/irenegl3/practica_big_data_2020-v2

## Instrucciones de despliegue
1. Acceder al proyecto local-288807 de Google Cloud
2. Abrir la terminal
3. Copiar los siguientes ficheros dentro de tu repositorio local de gcloud:
    - despliegue.sh
    - deployment.yaml
    - configmap.yaml
4. Dar permisos de ejecución al fichero de despliegue:
`chmod +x despliegue.sh`
5. Ejecutar el fichero del despliegue del escenario:
`./despliegue.sh`
6. Esperar 10-12 minutos hasta que se entrene el modelo
7. Probar el funcionamiento en: *34.89.103.210:30500/flights/delays/predict_kafka*

## Autores
- Ignacio Arregui
- Belén Balmori
- Irene García 
