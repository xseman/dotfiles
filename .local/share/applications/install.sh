#!/bin/sh

cp -rv ./* ~/.local/share/applications/
update-desktop-database ~/.local/share/applications/

echo "Updating applications entry database..."

sudo cp -v ./dwm.desktop /usr/share/xsessions/

echo "Done..."
