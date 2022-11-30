#!/bin/bash
# shellcheck disable=SC1090

set -e

init() {
	echo "Void specific packages..."

	xbps-query -Rs void-repo
	sudo xbps-install void-repo-nonfree
	sudo xbps-install -Su xtools
}

# Install packages
# @param args... list of valid packages
install_packages() {
	sudo xbps-install -Syu "${@}"
}

install_devel() {
	local DEVEL=(
		"libX11-devel"
		"libXft-devel"
		"libXinerama-devel"
		"libXrandr-devel"
	)

	echo "Installing development libraries..."
	install_packages "${DEVEL[@]}"
}

install_desktop() {
	local DESKTOP=(
		"dmenu"
		"dwm"
		"gitg"
		"slstatus"
		"st"
		"xfce4"
		"xinit"
		"xorg"
	)

	echo "Basic desktop environment..."
	install_packages "${DESKTOP[@]}"
}

install_core() {
	local CORE=(
		"asciiquarium"
		"base-devel"
		"bash-completion"
		"bind-utils"
		"dunst"
		"entr"
		"fd"
		"fish-shell"
		"fzf"
		"gdu"
		"git-lfs"
		"git"
		"gitflow"
		"github-cli"
		"go"
		"grep"
		"htop"
		"ImageMagick"
		"jq"
		"lf"
		"libvirt"
		"light"
		"links"
		"lnav"
		"minicom"
		"mons"
		"ncdu"
		"ncpamixer"
		"neofetch"
		"netcat"
		"nmap"
		"nodejs"
		"openntpd"
		"pandoc"
		"pasystray"
		"pgcli"
		"plantuml"
		"poppler-utils"
		"postgresql"
		"psmisc"
		"ripgrep"
		"rsync"
		"scrcpy"
		"shellcheck"
		"smu"
		"sqlite"
		"sxiv"
		"tig"
		"tmux"
		"tree"
		"udisks2"
		"unrar"
		"unzip"
		"usbutils"
		"usql"
		"util-linux"
		"vim"
		"wget"
		"whois"
		"xclip"
		"xdotool"
		"xz"
		"youtube-dl"
		"zip"
	)

	echo "Installing core packages..."
	install_packages "${CORE[@]}"
}

install_services() {
	local SERVICES=(
		"avahi" # mdns
		"docker-compose"
		"docker"
		"ibus"
		"iwd"
		"openssh"
		"openvpn"
	)

	echo "Installing services packages..."
	install_packages "${SERVICES[@]}"
}

install_graphical() {
	local GRAPHICAL=(
		"alacritty"
		"android-file-transfer-linux"
		"arandr"
		"audacity"
		"blender"
		"blueman"
		"brasero"
		"chromium"
		"dbeaver"
		"firefox"
		"fontmanager"
		"gimp"
		"gparted"
		"grabc"
		"inkscape"
		"keepassxc"
		"libreoffice"
		"lxappearance"
		"mpv"
		"network-manager-applet"
		"NetworkManager"
		"obs"
		"picom"
		"qemu"
		"rxvt-unicode" # urxvt
		"shotwell"
		"Signal-Desktop"
		"simple-scan"
		"system-config-printer"
		"Thunar"
		"thunderbird"
		"timeshift"
		"transmission-gtk"
		"udiskie"
		"virt-manager"
		"vlc"
		"vscode"
		"xsel"
	)

	echo "Installing graphical packages..."
	install_packages "${GRAPHICAL[@]}"
}

install_audio() {
	local AUDIO=(
		"alsa-pipewire"
		"libjack-pipewire"
		"libspa-bluetooth"
		"pavucontrol"
		"pipewire"
		"qpwgraph"
	)

	echo "Installing audio tools..."
	install_packages "${AUDIO[@]}"
}

init
install_devel
install_desktop
install_core
install_services
install_graphical
install_audio


setup_services() {
	echo "Setup common services"
	sudo ln -sf /etc/sv/{sshd,dhcpd,dbus,iwd} /var/service
}

setup_services

setup_date_time() {
	echo "Setup date and time"
	sudo ln -sf /usr/share/zoneinfo/Europe/Bratislava /etc/localtime
	sudo ln -s /etc/sv/openntpd /var/service/
}


post_install() {
	# Prepare users local hierarchy
	mkdir -p ~/.local/{bin,share}

	echo "Running postinstall scripts..."
	for script in install-*; do
		source "${script}"
	done
}

post_install
