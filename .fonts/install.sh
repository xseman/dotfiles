#!/bin/sh
# shellcheck disable=SC2174

cd "$(dirname "${0}")" || exit 1

mkdir -p ~/.fonts && cp -rv ./* ~/.fonts/
fc-cache -fv

echo "Run fc-list to view installed fonts..."
