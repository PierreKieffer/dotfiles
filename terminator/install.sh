#!/bin/bash 
sudo add-apt-repository ppa:gnome-terminator && sudo apt update && sudo apt install -y terminator 
mkdir ~/.config/terminator
cp config ~/.config/terminator/config
