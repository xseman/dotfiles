#!/bin/sh
#
# Run desktop environment, executed by startx.
# See startx(1) and xinit(1) for details.

[ -f ~/.Xresources ] && {
    xrdb -merge -I "${HOME}"/.Xresources
}

# Thinkpad T480 Trackpoint config
xinput set-prop "Synaptics TM3276-022" "libinput Natural Scrolling Enabled" 1
xinput set-prop "Synaptics TM3276-022" "libinput Tapping Enabled" 1

# Background color
xsetroot -solid "#666666"

# Faster key holding / pressing
xset r rate 150 40

# Disable dpms, because slock will handle it
xset dpms 0 0 0

# Notification daemon
dunst -geom '300x5-25+35' &

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

# Lightweight compositor
# picom --vsync -b

# Suckless window status
~/.local/bin/slstatus &

# Suckless window manager
exec dbus-launch \
    --exit-with-session \
    ~/.local/bin/dwm 2>~/.dwm.log
