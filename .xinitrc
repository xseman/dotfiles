#!/bin/bash

# Run desktop environment. Executed by startx.
# See startx(1) and xinit(1) for details.

# Install
# -------
#
#   ln -s ~/.xinitrc ~/.xsession
#   chmod 755 .xsession
#
#   ~/.xinitrc is executed by xinit, which is usually invoked via startx.
#   ~/.xsession is executed when you log in in graphical mode (ex. gdm)

# Requirements
# ------------
#
# Fonts:
#   - FontAwesome

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

[[ -f ~/.Xresources ]] && {
    xrdb -merge -I$HOME ~/.Xresources
}

# Background color
exec hsetroot -solid "#666666" &

# Increase key repeat rate
exec xset r rate 150 40 &

# Trackpad T480, (tap click, natural scrolling)
SYNAPTICS_ID="$(
    xinput |
    grep Synaptics |
    awk '{print substr($5,4)}'
)"
PROP_ID_NATURAL="$(
    xinput list-props ${SYNAPTICS_ID} |
    grep 'Natural Scrolling Enabled (' |
    awk -F"[()]" '{print $2}'
)"
PROP_ID_TAP="$(
    xinput list-props ${SYNAPTICS_ID} |
    grep 'Tapping Enabled (' |
    awk -F"[()]" '{print $2}'
)"
exec xinput set-prop ${SYNAPTICS_ID} ${PROP_ID_NATURAL} 1 &
exec xinput set-prop ${SYNAPTICS_ID} ${PROP_ID_TAP} 1 &

# Notification daemon
exec dunst -geom '300x5-25+35' &

# Start xautolock with slock
exec xautolock -time 30 -locker slock &

# Systray
exec ibus-daemon -d -r &
exec pasystray &
exec start-pulseaudio-x11 &
exec blueman-applet &
exec nm-applet &

# Compositor
exec picom &

# Menu info
while :; do
    CHARGING="$(cat /sys/class/power_supply/AC/online)"
    [[ "${CHARGING}" == 1 ]] & BAT=" " || BAT=" "

    [[ -L /sys/class/power_supply/BAT1/capacity ]] & {
        BAT_INTERNAL="$(cat /sys/class/power_supply/BAT1/capacity)"
        BAT="${BAT} ${BAT_INTERNAL}%"
    }
    [[ -L /sys/class/power_supply/BAT0/capacity ]] & {
        BAT_EXTERNAL="$(cat /sys/class/power_supply/BAT0/capacity)"
        BAT="${BAT} / ${BAT_EXTERNAL}%"
    }
    BAR_INFO="${BAT} ~"

    IP_WIFI=$(
        ip addr show dev wlp3s0 \
        |grep "inet " \
        | cut -d ' ' -f 6 \
        | cut -f 1 -d '/'
    )
    [[ -n "$IP_WIFI" ]] && {
        BAR_INFO="${BAR_INFO}  ${IP_WIFI} ~"
    }

    IP_ETH=$(
        ip addr show dev enp0s31f6 \
        | grep "inet " \
        | cut -d ' ' -f 6 \
        | cut -f 1 -d '/'
    )
    [[ -n "$IP_ETH" ]] && {
        BAR_INFO="${BAR_INFO} 󰈀 ${IP_ETH} ~"
    }

    DATE="󱑎 $(date "+%d.%m.%Y %H:%M")"
    BAR_INFO="${BAR_INFO} ${DATE}"

    xsetroot -name "${BAR_INFO}"
    sleep 30s
done &

exec dwm 2> ~/.dwm.log
