#!/bin/sh
# shellcheck disable=SC2174

cd "$(dirname "${0}")" || exit 1

mkdir -m 0777 -p ~/.fonts && sudo cp -rv ./* ~/.fonts/

fc-cache -fv
# fc-list

echo "Run fc-list to view installed fonts..."
