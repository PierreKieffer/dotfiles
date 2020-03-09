#!/bin/bash 

sudo apt update 
sudo apt install vim 
sudo apt install git 
sudo apt install curl 
sudo apt install scala 
sudo apt install golang-go
sudo apt install openjdk-8-jre-headless 
wget -P ~/Downloads https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
bash ~/Downloads/Anaconda3-2019.10-Linux-x86_64.sh
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install apt-transport-https ca-certificates gnupg
sudo apt-get update && sudo apt-get install google-cloud-sdk
sudo apt install kubectl
sudo apt install git
sudo apt install mongodb-clients




