#!/bin/sh

sudo -v

# Install all the dependencies
apt update && upgrade -y

echo "Installation started..."

apt install -y \
    # ========
    # BROWSERS
    # ========
    chromium \
    firefox-esr \
    links \
    # =======
    # EDITORS
    # =======
    neovim \
    vim \

    # ===
    # DEV
    # ===
    build-essential \
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
    postgresql \
    tmux \
    wget \

    # =====
    # AUDIO
    # =====
    alsamixer \
    amixer \

    # =======
    # SYSTRAY
    # =======
    ibus \
    nm-applet \
    pasystray \

    # =====
    # MEDIA
    # =====
    calibre \
    gimp \
    imagemagick \
    inkscape \
    mpv \
    sxiv \
    vlc \
    youtube-dl \

    # ======
    # OFFICE
    # ======
    onlyoffice \
    pandoc \
    poppler-utils \
    potrace \
    # =======
    # NETWORK
    # =======
    iperf3 \
    network-manager-openvpn \
    nmap \

    # =====
    # OTHER
    # =====
    findutils \
    fish \
    fzf \
    grep \
    htop \
    jq \
    lf \
    mc \
    openssh \
    tree \
    aptitude \
    arandr

echo "Changing shell..."

# Change default shell
chsh -s `which fish`

echo "Update 'locate' database"

# Update locate database
updatedb

echo "Done..."
