#!/usr/bin/env bash
osname=$(uname)
[[ $osname == "Linux" ]] && sudo yum install epel-release vim git -y
[ -d ~/.vim/bundle/Vundle.vim ] && echo need not to clone || git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

