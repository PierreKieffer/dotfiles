#!/bin/bash 

sudo apt update \
	&& apt install -y vim \ 
	&& apt install -y git \
	&& apt install -y curl \ 
	&& apt install -y openjdk-8-jre-headless \
	&& apt install -y  mongodb-clients
	
sudo apt-get remove scala-library scala
sudo wget www.scala-lang.org/files/archive/scala-2.11.8.deb
sudo dpkg -i scala-2.11.8.deb

wget -P ~/Downloads https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
bash ~/Downloads/Anaconda3-2019.10-Linux-x86_64.sh
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install apt-transport-https ca-certificates gnupg \
	&& apt-get update \
	&& apt-get install -y google-cloud-sdk \
	&& apt install -y kubectl




