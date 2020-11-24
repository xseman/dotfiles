#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Install all the dependencies
apt update
apt upgrade -y
apt install --fix-broken -y

# Install binaries
APPS=(
    # browsers
    chromium
    firefox-esr
    links

    # editors
    neovim
    vim

    # dev
    build-essential
    ctop
    curl
    deno
    diff-so-fancy
    git
    git-lfs
    gitg
    netcat
    node
    pgcli
    php
    postgresql
    tmux
    wget

    # other useful
    findutils
    fish
    fzf
    grep
    htop
    jq
    lf
    mc
    openssh
    tree
    aptitude
    arandr

    # audio
    alsamixer
    amixer

    # systray
    ibus
    nm-applet
    pasystray

    # media
    calibre
    gimp
    imagemagick
    inkscape
    mpv
    sxiv
    vlc
    youtube-dl

    # office
    onlyoffice
    pandoc
    poppler-utils
    potrace

    # network
    iperf3
    network-manager-openvpn
    nmap
)

echo "Installation started..."

for bin in "${APPS[@]}"; do
    apt install $bin
done

# Change default shell
chsh -s `which fish`

# Update locate database
updatedb

echo "Installation done..."
