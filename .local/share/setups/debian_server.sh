#!/bin/sh

# Debian server setup
# ===================

# Requirements
# ------------
# Debian 10+

# Install all the dependencies
sudo apt update && upgrade -y
sudo apt install --fix-broken -y

sudo apt install -y \
    build-essential \
    curl \
    fish \
    git \
    vim \
    tmux \
    wget

sudo apt install --fix-broken -y

echo "Changing to fish shell..."

# Change default shell
chsh -s `which fish`

echo "Done..."
