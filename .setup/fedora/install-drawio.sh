#!/bin/bash
# shellcheck disable=SC2155

REPO="jgraph/drawio-desktop"

latest() {
	local URI="https://api.github.com/repos/${1}/releases"
	local VER=$(curl -s "${URI}" | jq --raw-output '.[0].tag_name')
	echo "${VER}"
}

VER=$(latest ${REPO})
ARCH="drawio-x86_64-${VER:1}.rpm"

install() {
	curl -L https://github.com/${REPO}/releases/download/"${VER}"/"${ARCH}" > /tmp/"${ARCH}"
	sudo dnf install /tmp/"${ARCH}"
}

install

echo "drawio install completed..."
