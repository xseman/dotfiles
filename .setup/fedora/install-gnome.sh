#!/bin/bash

gsettings set org.gnome.desktop.wm.preferences num-workspaces 9

for i in {1..9}; do
	gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-$i" "['<Alt>$i']"
	gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-$i" "['<Shift><Alt>$i']"
done

## keyboard keybindings
gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>q']"
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Super>Down']"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Alt>f']"

gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down []
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left []
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right []
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right []

## keyboard accessibility
gsettings set org.gnome.desktop.peripherals.keyboard delay 150
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30

## disable animations
gsettings set org.gnome.desktop.interface enable-animations false

## mouse
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier "<Alt>"
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.peripherals.mouse accel-profile default

## windows
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up "['<Alt>period']"
gsettings set org.gnome.desktop.wm.preferences focus-mode mouse
gsettings set org.gnome.desktop.wm.preferences.focus-new-windows "smart"
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.mutter focus-change-on-pointer-rest false
gsettings set org.gnome.shell.extensions.pop-shell focus-left "['<Super>Left']"
gsettings set org.gnome.shell.extensions.pop-shell focus-right "['<Super>Right']"

## files
gsettings set org.gtk.settings.file-chooser show-hidden true
gsettings set org.gtk.gtk4.settings.file-chooser show-hidden true
gsettings set org.gtk.gtk4.settings.file-chooser sort-directories-first true

## others
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0

## experimental
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer', 'xwayland-native-scaling']"
