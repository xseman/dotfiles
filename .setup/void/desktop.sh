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
		"go"
		"libX11-devel"
		"libXft-devel"
		"libXinerama-devel"
		"libXrandr-devel"
		"nodejs"
        "apache-maven"
        "openjdk"
        "pnpm"
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
		"grep"
		"htop"
		"ImageMagick"
		"jq"
		"lf"
		"light"
		"links"
		"lm_sensors"
		"lnav"
		"lsof"
		"mdns-scan"
		"minicom"
		"mons"
		"ncdu"
		"ncpamixer"
		"neofetch"
		"net-tools"
		"netcat"
		"nmap"
		"pandoc"
		"parallel"
		"pasystray"
		"pgcli"
		"plantuml"
		"poppler-utils"
		"postgresql"
		"psmisc"
		"ripgrep"
		"rsync"
		"scrcpy"
		"scrot"
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
		"cups-filters"
		"cups"
		"docker-compose"
		"docker"
		"ibus"
		"iwd"
		"openssh"
		"socklog-void"
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
		"obs"
		"rxvt-unicode" # urxvt
		"shotwell"
		"simple-scan"
		"system-config-printer"
		"Thunar"
		"thunderbird"
		"timeshift"
		"transmission-gtk"
		"udiskie"
		"vlc"
		"vscode"
		"xsel"
	)

	echo "Installing graphical packages..."
	install_packages "${GRAPHICAL[@]}"
}

install_virtualization() {
    local VIRT=(
        "qemu-ga"
		"qemu"
		"libvirt"
		"virt-manager"
    )

	echo "Installing virtualization packages..."
	install_packages "${VIRT[@]}"

    sudo usermod -aG kvm "$(whoami)"
    sudo modprobe kvm-intel

    sudo ln -sf /etc/sv/libvirtd/ /var/service/
    sudo ln -sf /etc/sv/virtlockd/ /var/service/
    sudo ln -sf /etc/sv/virtlogd/ /var/service/
}

install_network() {
	local NETWORK=(
		"network-manager-applet"
		"NetworkManager-openvpn"
		"NetworkManager"
		"openvpn"
        "dhcp"
	)

	echo "Installing networking tools..."
	install_packages "${NETWORK[@]}"
}

install_audio() {
	local AUDIO=(
		"alsa-pipewire"
		"helvum"
		"libjack-pipewire"
		"libspa-bluetooth"
		"pavucontrol"
		"pipewire"
	)

	echo "Installing audio tools..."
	install_packages "${AUDIO[@]}"
}

install_latex() {
	local LATEX=(
		"texlive"
		"texlive-bin"
	)

	echo "Installing latex tools..."
	install_packages "${LATEX[@]}"
}

init
install_audio
install_core
install_desktop
install_devel
install_graphical
install_latex
install_network
install_services
install_virtualization

setup_services() {
	echo "Setup common services"
	sudo ln -sf /etc/sv/{nanoklogd,socklog-unix,sshd,dbus,iwd,cupsd,bluetoothd,avahi-daemon,NetworkManager} /var/service
}

setup_date_time() {
	local TIME=(
        "chrony"
	)

	echo "Setup date and time"
	install_packages "${TIME[@]}"

	sudo ln -sf /usr/share/zoneinfo/Europe/Bratislava /etc/localtime
    sudo ln -sf /etc/sv/chronyd/ /var/service/

	sudo hwclock --systohc --localtime
}

setup_services
setup_date_time


post_install() {
	# Prepare users local hierarchy
	mkdir -p ~/.local/{bin,share}

	echo "Running postinstall scripts..."
	for script in install-*; do
		source "${script}"
	done
}

post_install
