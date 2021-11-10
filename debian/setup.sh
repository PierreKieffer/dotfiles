#!/bin/bash

###################
# Debian 10 setup # 
###################

sudo apt update \
	&& sudo apt install -y vim \
	&& sudo apt install -y git \
	&& sudo apt install -y zip \
	&& sudo apt install -y unzip \
	&& sudo apt install -y curl \
	&& sudo apt install -y wget \
	&& sudo apt install -y make \
	&& sudo apt install -y tig \
	&& sudo apt install -y tree \

# vim 
cd ../vim && ./install.sh 

# Python 
sudo apt install -y python3-pip
sudo apt install -y python3-venv
echo "alias pip='pip3'" >> $HOME/.bashrc
echo "alias python='python3'" >> $HOME/.bashrc

# Go 
wget https://golang.org/dl/go1.17.3.linux-amd64.tar.gz 
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.3.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.bashrc
echo 'export GOROOT=/usr/local/go' >> $HOME/.bashrc
echo 'export GOPATH=/home/$USER/go' >> $HOME/.bashrc
rm go1.17.3.linux-amd64.tar.gz

# Docker 
sudo apt -y update && sudo apt -y upgrade
sudo apt -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
