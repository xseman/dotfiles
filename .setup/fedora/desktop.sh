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
		"gh"
		"git"
		"git-lfs"
		"golang"
		"java-11-openjdk"
		"java-17-openjdk"
		"maven"
		"nodejs"
		"php"
		"php-cli"
	)

	echo "Installing development libraries..."
	install_packages "${DEVEL[@]}"
}

install_python() {
	local PREREQUISITES=(
		"zlib-devel"
		"bzip2"
		"bzip2-devel"
		"readline-devel"
		"sqlite"
		"sqlite-devel"
		"openssl-devel"
		"xz"
		"xz-devel"
		"libffi-devel"
		"findutils"
	)

	install_packages "${PREREQUISITES[@]}"

	local PACKAGES=(
		"pip"
		"pipenv"
		"pipfile"
		"pyenv"
		"python3"
		"python3-virtualenv"
	)

	install_packages "${PACKAGES[@]}"
}

install_core() {
	local CORE=(
		"ImageMagick"
		"bash-completion"
		"bind-utils"
		"entr"
		"fd-find"
		"fish"
		"fzf"
		"gnuplot"
		"htop"
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
		"ngrep"
		"nmap"
		"openssl"
		"pandoc"
		"parallel"
		"pcre2-tools"
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
		"zathura"
		"zathura-pdf-mupdf"
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
		"openssh"
		"podman-compose"
		"podman"
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
		"google-chrome-stable"
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

install_gnome_extensions() {
	local EXTENSIONS=(
		"gnome-shell-extension-arcmenu"
		"gnome-shell-extension-caffeine"
		"gnome-shell-extension-clipboard-history"
		"gnome-shell-extension-ddterm"
		"gnome-shell-extension-wifiqrcode"
	)

	echo "Installing gnome extensions..."
	install_packages "${EXTENSIONS[@]}"
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
		"texlive-scheme-full"
		"texlive-fontawesome"
		"texlive-fontsetup"
		"texlive-fontsize"
		"texlive-ifthenx"
		"texlive-parskip"
		"texlive-pst-graphicx"
		"texlive-scheme-basic"
		"texlive"
	)

	echo "Installing latex tools..."
	install_packages "${LATEX[@]}"
}

install_docs() {
	local DOCS=(
		"pdfarranger"
	)

	echo "Installing docs..."
	install_packages "${DOCS[@]}"
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
	# go install github.com/wagoodman/dive@latest
}

install_audio
install_core
install_devel
install_python
install_fonts
install_go_binaries
install_graphical
install_latex
install_network
install_services
install_virtualization
install_wayland
install_gnome_extensions

post_install() {
	mkdir -p ~/.local/{bin,share}

	echo "Running postinstall scripts..."
	for script in $(find ./ -name "install-*.sh"); do
		source "${script}"
	done
}

post_install
