#!/bin/bash
#apt-get update
#apt-get upgrade

DEBIAN_FRONTEND=noninteractive
INSTALL="apt-get -yq install"

NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'

function yell(){
    echo -e $GREEN$*$NOCOLOR
}

yell "Install cli tools?"
read CHK
if [[ "$CHK" == "y" ]]; then 
    $INSTALL \
        build-essential \
        curl \
        fortune-mod \
        git \
        htop \
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

yell "Install X11 and friends?"
read CHK
if [[ "$CHK" == "y" ]]; then 
    $INSTALL \
        alsa-utils \
        arandr \
        compton \
        feh \
        firefox-esr \
        libnotify-bin \
        notification-daemon \
        openbox \
        rxvt-unicode \
        tint2 \
        ttf-mscorefonts-installer \
        x11-common \
        x11-session-utils \
        x11-utils \
        xclip \
        xfonts-terminus \
        xserver-xorg \
        ;
fi

yell "Install network utils?"
read CHK
if [[ "$CHK" == "y" ]]; then 
    $INSTALL \
        netcat \
        nftables \
        nmap \
        tcpdump \
        ;
fi

yell "Install linux kernel headers?"
read CHK
if [[ "$CHK" == "y" ]]; then 
    $INSTALL \
        linux-headers-amd64 \
        ;
fi

yell "Install misc. firmware/drivers?"
read CHK
if [[ "$CHK" == "y" ]]; then 
    $INSTALL \
        amd64-microcode \
        firmware-amd-graphics \
        firmware-linux-nonfree \
        ;
fi
