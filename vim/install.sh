#!/bin/bash 

# install vim-plug 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# copy .vimrc file to home dir 
cp $PWD/vimrc /home/$USER/.vimrc 
