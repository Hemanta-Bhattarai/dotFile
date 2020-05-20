#!/bin/bash

path=$(pwd)
#copy vim config file
cp -rf $path/vim/vim ~/.vim
cp -rf $path/vim/viminfo ~/.viminfo
cp -rf $path/vim/vimrc ~/.vimrc

#copy tmux config file

cp -rf $path/tmux/tmux.conf ~/.tmux.conf
cp -rf $path/tmux/tmux.reset.conf ~/.tmux.reset.conf


#copy hammarspoon file

cp -rf $path/hammarspoon/hammarspoon ~/.hammarspoon
