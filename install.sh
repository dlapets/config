#!/bin/sh

if [ "$HOME/.vimrc" == `pwd` ]
then
    echo "You put me in `pwd`, you pile of crap. I hate that place. Move me."
    exit 1
fi

if [ ! -d directory ]
then
    echo "Setting up temp directory"
    mkdir directory
fi

if [ ! -d bundle ]
then 
    echo "Setting up bundle directory"
    mkdir bundle
fi

if [ ! -d bundle/Vundle.vim ]
then
    echo "Fetching Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim || { echo >&2 "git clone failed, cannot continue."; exit 1;}
fi

if [ -f $HOME/.vimrc ]
then
    echo "Removing old .vimrc"
    rm $HOME/.vimrc
fi

echo "Linking new .vimrc"
ln -s `pwd`/vimrc $HOME/.vimrc

if [ "$HOME/.vim" != `pwd` ]
then

    if [ -e "$HOME/.vim" ]
    then
    	echo "Removing old .vim/"
        rm -rf $HOME/.vim 
    fi
    echo "Linking .vim to `pwd`"
    ln -s `pwd` $HOME/.vim
else
    echo "You're using the default vimrc location"
fi

echo "Installing plugins"
vim +PluginInstall +qall
