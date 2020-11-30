kubectl create -f services.yaml
gcloud compute firewall-rules create allow-webserver --allow=tcp:30500
