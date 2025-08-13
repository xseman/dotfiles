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
		"direnv"
		"gh"
		"git-extras"
		"git-lfs"
		"git-subtree"
		"git"
		"glib2-devel"
		"golang"
		"gtk3-devel"
		"java-17-openjdk"
		"java-21-openjdk"
		"maven"
		"nodejs"
		"php-cli"
		"php"
		"pkgconfig"
		"python3-pip"
		"python3"
		"webkit2gtk3-devel"
		"webkit2gtk4.0"
	)

	echo "Installing development libraries..."
	install_packages "${DEVEL[@]}"
}

install_core() {
	local CORE=(
		"bash-completion"
		"bind-utils"
		"caddy"
		"entr"
		"fd-find"
		"fish"
		"fzf"
		"gnuplot"
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
		"zathura-pdf-mupdf"
		"zathura"
		"zip"
	)

	echo "Installing core packages..."
	install_packages "${CORE[@]}"
}

install_services() {
	local SERVICES=(
		"avahi-tools"
		"avahi" # mdns
		"docker-compose"
		"docker"
		"lxc"
		"nss-mdns"
		"openssh"
		"podman-compose"
		"podman"
	)

	echo "Installing services packages..."
	install_packages "${SERVICES[@]}"

	sudo systemctl enable --now avahi-daemon
	sudo hostnamectl set-hostname filip-fedora
}

install_graphical() {
	local GRAPHICAL=(
		"alacritty"
		"android-file-transfer"
		"audacity"
		"brasero"
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
	)

	echo "Installing gnome extensions..."
	install_packages "${EXTENSIONS[@]}"
}

install_virtualization() {
	local VIRT=(
		"libvirt"
		"qemu"
		"virt-install"
		"virt-manager"
	)

	echo "Installing virtualization packages..."
	install_packages "${VIRT[@]}"

	sudo systemctl enable --now libvirtd
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
		# "texlive-scheme-full"
		"texlive"
		"texlive-fontawesome"
		"texlive-fontsetup"
		"texlive-fontsize"
		"texlive-ifthenx"
		"texlive-parskip"
		"texlive-pst-graphicx"
		"texlive-scheme-basic"
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

install_go_binaries() {
	go install github.com/antonmedv/fx@latest
	go install github.com/mikefarah/yq/v4@latest
	go install github.com/xo/usql@latest
	go install github.com/dundee/gdu/v5/cmd/gdu@latest
	go install github.com/gokcehan/lf@latest
	go install github.com/wagoodman/dive@latest
}

post_install() {
	mkdir -p ~/.local/{bin,share}

	echo "Running postinstall scripts..."
	for script in $(find ./ -name "install-*.sh"); do
		echo "running ${script}"
		source "${script}"
	done
}

install_audio
install_core
install_devel
install_go_binaries
install_graphical
install_latex
install_network
install_services
install_virtualization
install_wayland
# install_gnome_extensions
post_install
