#!/bin/sh
#
# Run desktop environment, executed by startx.
# See startx(1) and xinit(1) for details.

[ -f ~/.Xresources ] && {
	xrdb -merge -I "${HOME}"/.Xresources
}

# Thinkpad T480 Trackpoint
# xinput set-prop "Synaptics TM3276-022" "libinput Natural Scrolling Enabled" 1
# xinput set-prop "Synaptics TM3276-022" "libinput Tapping Enabled" 1

# Background color
xsetroot -solid "#666666"

# Faster key holding / pressing
xset r rate 150 40

# Disable dpms, because slock will handle it
xset dpms 0 0 0

# Notification daemon
dunst --geom &

# Autolock screen with Suckless lock
xautolock \
	-time 30 \
	-locker slock &

# Systray
blueman-applet &
start-pulseaudio-x11 &
ibus-daemon -d -r &
pasystray &
nm-applet &
udiskie -t &

# pipewire configs
# https://itmecho.com/blog/voidlinux-setup-pipewire
export XDG_RUNTIME_DIR="/run/user/$(id -u ${USER})"
mkdir "${XDG_RUNTIME_DIR}"
chown "${USER}":"${USER}" "${XDG_RUNTIME_DIR}"
pipewire &
pipewire-pulse &

# Suckless window status
~/.local/bin/slstatus &

# Suckless window manager
exec dwm 2>~/.dwm.log
