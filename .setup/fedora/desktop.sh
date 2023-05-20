#!/bin/bash
# shellcheck disable=SC1090,SC2044

set -e

# Install packages
# @param args... list of valid packages
install_packages() {
	sudo dnf install "${@}"
}

install_devel() {
	local DEVEL=(
		"git-lfs"
		"git"
		"golang"
		"nodejs"
        "java-11-openjdk"
        "java-17-openjdk"
        "maven"
	)

	echo "Installing development libraries..."
	install_packages "${DEVEL[@]}"
}

install_core() {
	local CORE=(
		"bash-completion"
		"bind-utils"
		"entr"
		"fd-find"
		"fish"
		"fzf"
		"htop"
		"ImageMagick"
		"jq"
		"links"
		"lm_sensors"
		"lnav"
		"lsof"
		"mdns-scan"
		"minicom"
		"ncdu"
		"neofetch"
		"net-tools"
		"netcat"
		"nmap"
		"pandoc"
		"parallel"
		"pgcli"
		"plantuml"
		"poppler-utils"
		"postgresql"
		"psmisc"
		"ripgrep"
		"rsync"
		"shellcheck"
		"sqlite"
		"tig"
		"tmux"
		"tree"
		"udisks2"
		"unrar"
		"unzip"
		"usbutils"
		"util-linux-user"
		"vim"
		"wget"
		"whois"
		"wl-clipboard"
		"xz"
		"youtube-dl"
		"zathura-pdf-mupdf"
		"zathura"
		"zip"
	)

	echo "Installing core packages..."
	install_packages "${CORE[@]}"
}


install_services() {
	local SERVICES=(
		"avahi" # mdns
		"podman"
		"podman-compose"
		# "docker"
		# "docker-compose"
		"openssh"
	)

	echo "Installing services packages..."
	install_packages "${SERVICES[@]}"
}

install_graphical() {
	local GRAPHICAL=(
		"alacritty"
		"android-file-transfer"
		"audacity"
		"brasero"
		"chromium"
		"dconf-editor"
		"firefox"
		"gimp"
		"gitg"
		"gparted"
		"inkscape"
		"keepassxc"
		"libreoffice"
		"mpv"
		"obs-studio"
		"simple-scan"
		"timeshift"
		"transmission-gtk"
	)

	echo "Installing graphical packages..."
	install_packages "${GRAPHICAL[@]}"
}

install_wayland() {
	local APPS=(
		"wmctrl"
		"gnome-tweaks"
	)

	echo "Installing wayland packages..."
	install_packages "${APPS[@]}"
}

install_virtualization() {
    local VIRT=(
		"qemu"
		"libvirt"
		"virt-manager"
    )

	echo "Installing virtualization packages..."
	install_packages "${VIRT[@]}"

	sudo systemctl enable libvirtd
}

install_network() {
	local NETWORK=(
		"NetworkManager-openvpn"
		"openvpn"
	)

	echo "Installing networking tools..."
	install_packages "${NETWORK[@]}"
}

install_audio() {
	local AUDIO=(
		"helvum"
		"pipewire"
	)

	echo "Installing audio tools..."
	install_packages "${AUDIO[@]}"
}

install_latex() {
	local LATEX=(
		"texlive"
	)

	echo "Installing latex tools..."
	install_packages "${LATEX[@]}"
}

install_fonts() {
	local FONTS=(
		jetbrains-mono-fonts-all
		terminus-fonts
	)

	echo "Installing fonts..."
	install_packages "${FONTS[@]}"
}

install_go_binaries() {
	go install github.com/antonmedv/fx@latest
	go install github.com/mikefarah/yq@latest
	go install github.com/xo/usql@latest
    go install github.com/dundee/gdu/v5/cmd/gdu@latest
    go install github.com/gokcehan/lf@latest
}

install_audio
install_core
install_devel
install_fonts
install_go_binaries
install_graphical
install_latex
install_network
install_services
install_virtualization
install_wayland


post_install() {
	mkdir -p ~/.local/{bin,share}

	echo "Running postinstall scripts..."
	for script in $(find ./ -name "install-*.sh"); do
		source "${script}"
	done
}

post_install
