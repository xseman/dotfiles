#!/bin/bash
# shellcheck disable=SC2155

latest() {
	local URI="https://api.github.com/repos/${1}/releases"
	local VER=$(curl -s "${URI}" | jq --raw-output '.[0].tag_name')
	echo "${VER}"
}

REPO="bcicen/ctop"
VER=$(latest ${REPO})
ARCH="ctop-${VER:1}-linux-amd64"

curl -L https://github.com/${REPO}/releases/download/"${VER}"/"${ARCH}" > ~/.local/bin/ctop
chmod +x ~/.local/bin/ctop

echo "ctop install completed..."
