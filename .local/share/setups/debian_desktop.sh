#!/bin/sh

# Debian desktop setup
# ====================

# Requirements
# ------------
# Debian 10+

sudo -v

# Install all the dependencies
apt update && upgrade -y

echo "Installation started..."

apt install -y \
    # BROWSERS
    # --------
    chromium \
    firefox-esr \
    links \
    links2 \
    lynx \
    surf \

    # EDITORS
    # -------
    vim \

    # TERMINALS
    # ---------
    st \
    # alacritty \

    # SHELLS
    fish \

    # DEV
    # ---
    build-essenti \
    ctop \
    curl \
    deno \
    diff-so-fancy \
    entr \
    git \
    git-lfs \
    gitg \
    netcat \
    node \
    pgcli \
    php \
    plantuml \
    postgresql \
    tmux \
    wget \

    # AUDIO
    # -----
    alsamixer \
    amixer \

    # SYSTRAY
    # -------
    ibus \
    nm-applet \
    pasystray \

    # MEDIA
    # -----
    calibre \
    gimp \
    imagemagick \
    inkscape \
    mpv \
    sxiv \
    vlc \
    youtube-dl \

    # OFFICE
    # ------
    onlyoffice \
    pandoc \
    poppler-utils \
    potrace \

    # NETWORK
    # -------
    iperf3 \
    network-manager-openvpn \
    nmap \

    # OTHER
    # -----
    aptitude \
    arandr \
    blueman \
    findutils \
    font-manager \
    fzf \
    grabc \
    grep \
    htop \
    jq \
    lf \
    lxappearance \
    mc \
    openssh \
    system-config-printer \
    tree \
    xclip

echo "Changing default to fish shell..."
chsh -s `which fish`

echo "Updating 'locate' database..."
updatedb

echo "Done..."
