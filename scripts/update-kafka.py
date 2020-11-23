import os
f = open("../kafka_2.12-2.3.0/config/server.properties", "r")
lineas = f.readlines()
f.close()
f = open("../kafka_2.12-2.3.0/config/server.properties", "w")
host = os.getenv('ZOOKEPER_HOST')
port = os.getent('ZOOKEPER_PORT')
for l in lineas:
    if l == ' zookeper.connect=localhost:2181'+'\n':
        l = 'zookeper.connect=' + '"' + host + ':' + '"' + port + '\n'
    f.write(l)
f.close()
