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
cp nord/nord.vim /home/$USER/.vim/plugged/nord-vim/colors/nord.vim
cp lightline/colors/custom_nord.vim /home/$USER/.vim/plugged/lightline.vim/autoload/lightline/colorscheme/
