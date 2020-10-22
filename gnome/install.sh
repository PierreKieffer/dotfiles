#!/bin/bash 
sudo apt update
sudo apt install gnome-tweaks 

sudo rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.local/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.themes/{Arc,Arc-Darker,Arc-Dark}

sudo add-apt-repository ppa:noobslab/themes
sudo apt-get update
sudo apt-get install arc-theme

sudo add-apt-repository ppa:noobslab/icons
sudo apt-get update
sudo apt-get install arc-icons

sudo apt install gnome-shell-extensions
sudo apt remove gnome-shell-extension-ubuntu-dock






