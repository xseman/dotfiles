#!/bin/sh

cp -rv ./* ~/.local/share/applications/
cp -v ./dwm.desktop /usr/share/xsessions/

update-desktop-database ~/.local/share/applications/

echo "done..."
