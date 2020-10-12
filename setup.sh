#!/bin/bash 

sudo apt update \
	&& sudo apt install -y vim \
	&& sudo apt install -y git \
	&& sudo apt install -y zip \
	&& sudo apt install -y unzip \
	&& sudo apt install -y curl \
	&& sudo apt install -y wget \
	&& sudo apt install -y make \
	&& sudo apt install -y postgresql-client \
	&& sudo apt install -y  mongodb-clients

# vim 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp $PWD/vim/vimrc /home/$USER/.vimrc
vim +'PlugInstall --sync' +qa

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
echo 'export GOPATH=/home/$USER/go' >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.bashrc
rm go1.14.4.linux-amd64.tar.gz
mkdir -p $HOME/go/src

# sbt 
wget https://github.com/sbt/sbt/releases/download/v1.3.7/sbt-1.3.7.zip
mv sbt-1.3.7.zip /home/$USER
unzip /home/$USER/sbt-1.3.7.zip -d /home/$USER
rm /home/$USER/sbt-1.3.7.zip
echo 'export PATH=$PATH:/home/$USER/sbt/bin' >> /home/$USER/.bashrc

# python 
wget -P ~/Downloads https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
bash ~/Downloads/Anaconda3-2019.10-Linux-x86_64.sh
echo 'export PATH="/home/pierre/anaconda3/bin:$PATH"' >> $HOME/.bashrc

# docker 
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

# k8s 
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
sudo chmod +x kubectl
sudo mv kubectl /usr/local/bin/


