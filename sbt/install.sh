#!/bin/bash 

sudo apt-get update
sudo apt-get install -y \
        zip \
        unzip
wget https://piccolo.link/sbt-1.3.7.zip
mv sbt-1.3.7.zip /home/$USER
unzip /home/$USER/sbt-1.3.7.zip -d /home/$USER
rm /home/$USER/sbt-1.3.7.zip

echo 'export PATH=$PATH:/home/$USER/sbt/bin' >> /home/$USER/.bashrc

source /home/$USER/.bashrc
