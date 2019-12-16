#!/bin/bash
apt-get update
apt-get upgrade


echo "Install cli tools"
apt-get install \
    apt-get install \
    build-essential \
    fortune-mod \
    git \
    make \
    psmisc \
    silversearcher-ag \
    sudo \
    tmux \
    vim-nox \
    zsh \


echo "Install kernel headers"
apt-get install \
    linux-headers-amd64 \


echo "Install X11 and friends"
apt-get install \
    arandr \
    firefox-esr \
    fonts-roboto \
    notification-daemon \
    openbox \
    rxvt-unicode \
    ttf-mscorefonts-installer \
    x11-common \
    x11-session-utils \
    x11-utils \
    xclip \
    xfonts-terminus \
    xserver-xorg \


echo "Install misc. firmware/drivers"
apt-get install \
    amd64-microcode \
    firmware-amd-graphics \
    firmware-linux-nonfree \
    firmware-realtek \
