#!/bin/bash 

wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
tar -xvf go1.14.4.linux-amd64.tar.gz
sudo mv go /usr/local
echo 'export GOROOT=/usr/local/go' >> $HOME/.bashrc
echo 'GOPATH=$HOME/go' >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.bashrc

rm go1.14.4.linux-amd64.tar.gz

mkdir -p $HOME/go/src
