#!/bin/bash

path=$(pwd)
#copy vim config file
#cp -rf $path/vim/vim ~/.vim
cp -rf $path/vim/vimrc ~/.vimrc

#copy tmux config file

cp -rf $path/tmux/tmux.conf ~/.tmux.conf
cp -rf $path/tmux/tmux.reset.conf ~/.tmux.reset.conf


#copy hammerspoon file and source bashConfig

pathConfig="source $path/bash/bashConfig"
if [[ $OSTYPE == darwin* ]];then
    rm -rf ~/.hammerspoon 2>&1
    cp -rf $path/hammerspoon ~/.hammerspoon

string=$(grep "$pathConfig" ~/.bash_profile)
    if [[ -z $string ]]; then
        echo "$pathConfig" >> ~/.bash_profile
    fi
else

   string=$(grep "$pathConfig" ~/.bashrc)
    if [[ -z $string ]]; then
        echo "$pathConfig" >> ~/.bashrc
    fi

fi
