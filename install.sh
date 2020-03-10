#!/bin/bash 

chmod 777 -R $PWD/*

$PWD/terminator/install.sh
$PWD/dev/install.sh
$PWD/vim/install.sh
$PWD/gnome/install.sh
$PWD/docker/install.sh

