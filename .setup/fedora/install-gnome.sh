#!/bin/bash

gsettings set "org.gnome.desktop.wm.preferences" "num-workspaces" 9

for i in {1..9}; do
	gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-$i" "['<Alt>$i']"
	gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-$i" "['<Shift><Alt>$i']"
done

## keyboard keybindings
gsettings set "org.gnome.desktop.wm.keybindings" "close" "['<Alt>q']"
gsettings set "org.gnome.desktop.wm.keybindings" "toggle-maximized" "['<Super>Up']"
gsettings set "org.gnome.desktop.wm.keybindings" "unmaximize" "['<Super>Down']"

## keyboard accessibility
gsettings set "org.gnome.desktop.peripherals.keyboard" "delay" 150
gsettings set "org.gnome.desktop.peripherals.keyboard" "repeat-interval" 30

## disable animations
gsettings set "org.gnome.desktop.interface" "enable-animations" false

## mouse
gsettings set "org.gnome.desktop.wm.preferences" "mouse-button-modifier" "<Alt>"
gsettings set "org.gnome.desktop.wm.preferences" "resize-with-right-button" true

