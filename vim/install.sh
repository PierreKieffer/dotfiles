#!/bin/bash 

# install vim 
sudo apt update 
sudo apt install vim 

# install vim-plug 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# copy .vimrc file to home dir 
cp $PWD/vimrc /home/$USER/.vimrc 

# copy templates 
cp -r $PWD/templates /home/$USER/.vim/ 

# install plugins
vim +'PlugInstall --sync' +qa

# copy color scheme 
cp base16-vim/colors/base16-tomorrow-night.vim /home/$USER/.vim/plugged/base16-vim/colors
