#!/bin/bash
# shellcheck disable=SC1090
#
# The basic iso install might already include some of the packages
#
# TODO:
# yq 	-> mikefarah/yq
# ctop 	-> bcicen/ctop

set -e

echo "Void specific packages..."
xbps-query -Rs void-repo
sudo xbps-install void-repo-nonfree
sudo xbps-install -Su xtools

DESKTOP=(
	"dmenu"
	"dwm"
	"slstatus"
	"st"
	"xfce4"
	"xinit"
	"xorg"
)

echo "Basic desktop environment..."
sudo xbps-install -Su "${DESKTOP[@]}"


CORE=(
	"asciiquarium"
	"avahi"
	"base-devel"
	"bash-completion"
	"bind-utils"
	"docker-compose"
	"docker"
	"entr"
	"fd"
	"fish-shell"
	"fzf"
	"gdu"
	"git-lfs"
	"git"
	"gitg"
	"go"
	"grep"
	"htop"
	"ibus"
	"ImageMagick"
	"jq"
	"lf"
	"light"
	"links"
	"lnav"
	"minicom"
	"mons"
	"ncdu"
	"neofetch"
	"netcat"
	"nmap"
	"nodejs"
	"openssh"
	"openvpn"
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
	"unzip"
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
	# "ctop"
	# "yq"
)

echo "Installing core packages..."
sudo xbps-install -Su "${CORE[@]}"


GRAPHICAL=(
	"NetworkManager"
	"alacritty"
	"arandr"
	"audacity"
	"blender"
	"blueman"
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
	"obs"
	"pavucontrol"
	"picom"
	"pulseaudio"
	"qemu"
	"shotwell"
	"simple-scan"
	"system-config-printer"
	"Thunar"
	"transmission-gtk"
	"udiskie"
	"virt-manager"
	"virtualbox-ose"
	"vlc"
	"vscode"
	"xsel"
)

echo "Installing graphical packages..."
sudo xbps-install -Su "${GRAPHICAL[@]}"


echo "Postinstall scripts..."

for script in install-*; do
	source "${script}"
done


# Resources
# http://www.troubleshooters.com/linux/void/voidrepos.htm
# https://docs.voidlinux.org/xbps/index.html
