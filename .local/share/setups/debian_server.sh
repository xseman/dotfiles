#!/bin/sh

# Install all the dependencies
sudo apt update
sudo apt upgrade -y
sudo apt install --fix-broken -y

sudo apt install -y \
	build-essential \
	bash-completion \
	curl \
	wget \
	tmux \
	git \
	neovim \
	fish

sudo apt install --fix-broken -y
