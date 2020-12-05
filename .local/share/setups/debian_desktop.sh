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
    surf \

    # EDITORS
    # -------
    neovim \
    nvim \
    vim \

    # TERMINALS
    # ---------
    st \
    # alacritty \

    # DEV
    # ---
    build-essenti \
    ctop \
    curl \
    deno \
    diff-so-fancy \
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
    fish \
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

echo "Changing to fish shell..."

# Change default shell
chsh -s `which fish`

echo "Updating 'locate' database..."

# Update locate database
updatedb

echo "Done..."
