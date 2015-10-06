#!/bin/sh

echo "Set up temp directory"
if [ ! -d directory ]
then
    mkdir directory
fi

echo "Install pathogen"
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Update submodules"
git submodule init
git submodule update

echo "Set up vimrc"
if [ -f $HOME/.vimrc ]
then
    rm $HOME/.vimrc
fi

ln -s `pwd`/.vimrc $HOME/.vimrc
