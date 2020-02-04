#!/bin/bash 

sudo apt-get update
sudo apt-get install -y \
	zip \
	unzip
wget https://piccolo.link/sbt-0.13.15.zip
mv sbt-0.13.15.zip /home/$USER 
unzip /home/$USER/sbt-0.13.15.zip -d /home/$USER
rm /home/$USER/sbt-0.13.15.zip

echo 'export PATH=$PATH:/home/$USER/sbt/bin' >> /home/$USER/.bashrc
echo 'export TERM=xterm-color' >> /home/$USER/.bashrc
source /home/$USER/.bashrc


