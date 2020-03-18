#!/bin/bash

mkdir -p .vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo apt install build-essential cmake vim python3-dev
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --all
vim +PluginInstall +qall
