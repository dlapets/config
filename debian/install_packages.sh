#!/bin/bash
#apt-get update
#apt-get upgrade

DEBIAN_FRONTEND=noninteractive
INSTALL="apt-get -yq install"

echo "Install cli tools?"
read CHK
if [[ "$CHK" == "y" ]]; then 
    $INSTALL \
        build-essential \
        fortune-mod \
        git \
        jq \
        make \
        psmisc \
        silversearcher-ag \
        sudo \
        tmux \
        vim-nox \
        zsh \
        ;
fi

echo "Install X11 and friends?"
read CHK
if [[ "$CHK" == "y" ]]; then 
    $INSTALL \
        arandr \
        firefox-esr \
        fonts-roboto \
        libnotify-bin \
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
        ;
fi

echo "Install linux kernel headers?"
read CHK
if [[ "$CHK" == "y" ]]; then 
    $INSTALL \
        linux-headers-amd64 \
        ;
fi

echo "Install misc. firmware/drivers?"
read CHK
if [[ "$CHK" == "y" ]]; then 
    $INSTALL \
        amd64-microcode \
        firmware-amd-graphics \
        firmware-linux-nonfree \
        firmware-realtek \
        ;
fi
