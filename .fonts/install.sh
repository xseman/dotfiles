#!/bin/sh

cd "$(dirname "${0}")" || exit 1

mkdir -m 777 -p ~/.fonts && cp -rv ./* ~/.fonts/

fc-cache -fv

