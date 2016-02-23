#!/bin/sh

echo "Set up temp directory"
if [ ! -d directory ]
then
    mkdir directory
fi

vim +PluginInstall +qall

echo "Set up vimrc"
if [ -f $HOME/.vimrc ]
then
    rm $HOME/.vimrc
fi

ln -s `pwd`/vimrc $HOME/.vimrc
