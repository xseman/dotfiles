#!/bin/bash
# shellcheck disable=SC1090

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
	"base-devel"
	"bash-completion"
	"bind-utils"
	"entr"
	"fd"
	"fish-shell"
	"fzf"
	"gdu"
	"git-lfs"
	"git"
	"gitflow"
	"gitg"
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
sudo xbps-install -Su "${CORE[@]}"


SERVICES=(
	"avahi" # mdns
	"docker-compose"
	"docker"
	"ibus"
	"openssh"
	"openvpn"
)

echo "Installing services packages..."
sudo xbps-install -Su "${SERVICES[@]}"


GRAPHICAL=(
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
	"NetworkManager"
	"obs"
	"pavucontrol"
	"picom"
	"pulseaudio"
	"qemu"
	"rxvt-unicode" # urxvt
	"shotwell"
	"Signal-Desktop"
	"simple-scan"
	"system-config-printer"
	"Thunar"
	"thunderbird"
	"transmission-gtk"
	"udiskie"
	"virt-manager"
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
