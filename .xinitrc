#!/bin/bash
#
# Run desktop environment, executed by startx.
# See startx(1) and xinit(1) for details.

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "${f}" ] && . "${f}"
    done
    unset f
fi

[[ -f ~/.Xresources ]] && {
    xrdb -merge -I${HOME} ~/.Xresources
}

# Thinkpad T480 Trackpoint config
exec xinput set-prop "Synaptics TM3276-022" "libinput Natural Scrolling Enabled" 1 &
exec xinput set-prop "Synaptics TM3276-022" "libinput Tapping Enabled" 1 &

# Increase key repeat rate
exec xset r rate 150 40 &

# Background color
exec xsetroot -solid "#666666" &

# Notification daemon
exec dunst -geom '300x5-25+35' &

# Start xautolock with slock
exec xautolock -time 30 -locker slock &

# Suckless window status
# Xlib.h -> XStoreName(...)
# bash   -> xsetroot -name "..."
 exec slstatus &

# Systray
exec start-pulseaudio-x11 &
exec ibus-daemon -d -r &
exec pasystray &
exec nm-applet &

exec dbus-launch --exit-with-session dwm 2> ~/.dwm.log
