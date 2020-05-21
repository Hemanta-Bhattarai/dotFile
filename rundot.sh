#!/bin/bash

path=$(pwd)
#copy vim config file
cp -rf $path/vim/vim ~/.vim
cp -rf $path/vim/vimrc ~/.vimrc

#copy tmux config file

cp -rf $path/tmux/tmux.conf ~/.tmux.conf
cp -rf $path/tmux/tmux.reset.conf ~/.tmux.reset.conf


#copy hammerspoon file
rm -rf ~/.hammerspoon 2>&1 
cp -rf $path/hammerspoon ~/.hammerspoon
#copy bashconfig file
#edit your .bashrc or .bash_profile to source /.bashConfig
cp -rf $path/bash/bashConfig /.bashConfig
