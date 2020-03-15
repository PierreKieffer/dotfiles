#!/bin/bash 
sudo add-apt-repository ppa:gnome-terminator \
	&& apt-get update \ 
	&& apt-get install -y terminator 
mkdir ~/.config/terminator
cp config ~/.config/terminator/config
