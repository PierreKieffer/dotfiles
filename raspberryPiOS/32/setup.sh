#!/bin/bash 

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
	&& sudo apt install -y htop \

# go 
wget https://golang.org/dl/go1.15.6.linux-armv6l.tar.gz
tar -xvf go1.15.6.linux-armv6l.tar.gz
sudo mv go /usr/local
echo 'export GOROOT=/usr/local/go' >> $HOME/.bashrc
echo 'export GOPATH=/home/$USER/go' >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.bashrc
rm go1.15.6.linux-armv6l.tar.gz
mkdir -p $HOME/go/src

# python
sudo apt install -y python3-pip
sudo apt install -y python3-venv
echo "alias pip='pip3'" >> $HOME/.bashrc
echo "alias python='python3'" >> $HOME/.bashrc

# docker 
curl -fsSL https://get.docker.com -o get-docker.sh
sudo bash get-docker.sh
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
