#!/bin/bash
#Tested in Upcloud with Ubuntu 2020
echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' >> /etc/apt/sources.list.d/kubernetes.list
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
apt-get update && apt-get upgrade -qq && apt-get install -y vim docker.io kubectl

enabled=$(systemctl status docker.service | grep enabled)
while [ -z "$enabled" ] ;  
do 
     systemctl enable docker.service; 
	 sleep 5 
	 enabled=$(systemctl status docker.service | grep enabled)
done


#Installing Minikube
#https://minikube.sigs.k8s.io/docs/start/
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb && dpkg -i minikube_latest_amd64.deb

#adduser youruser
#usermod -aG docker youruser


#su -s youruser
#minikube start --driver docker
#minikube start --nodes 2 
