#!/bin/bash
sudo apt-get install -y apt-transport-https \
        && sudo apt-get install -y ca-certificates \
        && sudo apt-get install -y gnupg-agent \
        && sudo apt-get install -y software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose
sudo gpasswd -a $USER docker
