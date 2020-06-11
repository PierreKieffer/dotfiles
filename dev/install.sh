#!/bin/bash 

sudo apt update \
	&& apt install -y vim \ 
	&& apt install -y git \
	&& apt install -y zip \
	&& apt install -y unzip \
	&& apt install -y curl \ 
	&& apt install -y  mongodb-clients

# java 
sudo apt-get install -y openjdk-8-jdk
echo 'JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> $HOME/.bashrc

# scala 
sudo apt-get remove scala-library scala
sudo wget www.scala-lang.org/files/archive/scala-2.11.8.deb
sudo dpkg -i scala-2.11.8.deb

# spark 
wget https://archive.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz
tar -xvf spark-2.4.4-bin-hadoop2.7.tgz
sudo mv spark-2.4.4-bin-hadoop2.7 /usr/local/spark
echo 'SPARK_HOME=/usr/local/spark' >> $HOME/.bashrc
rm spark-2.4.4-bin-hadoop2.7.tgz

# go 
wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
tar -xvf go1.14.4.linux-amd64.tar.gz
sudo mv go /usr/local
echo 'export GOROOT=/usr/local/go' >> $HOME/.bashrc
echo 'GOPATH=$HOME/go' >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.bashrc
rm go1.14.4.linux-amd64.tar.gz
mkdir -p $HOME/go/src

# sbt 
wget https://piccolo.link/sbt-1.3.7.zip
mv sbt-1.3.7.zip /home/$USER
unzip /home/$USER/sbt-1.3.7.zip -d /home/$USER
rm /home/$USER/sbt-1.3.7.zip

echo 'export PATH=$PATH:/home/$USER/sbt/bin' >> /home/$USER/.bashrc

# python 
wget -P ~/Downloads https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
bash ~/Downloads/Anaconda3-2019.10-Linux-x86_64.sh

# gcp + k8s 
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install apt-transport-https ca-certificates gnupg \
	&& apt-get update \
	&& apt-get install -y google-cloud-sdk \
	&& apt install -y kubectl




