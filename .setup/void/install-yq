#!/bin/bash
# shellcheck disable=SC2155

latest() {
	local URI="https://api.github.com/repos/${1}/releases"
	local VER=$(curl -s "${URI}" | jq --raw-output '.[0].tag_name')
	echo "${VER}"
}

REPO="mikefarah/yq"
ARCH="yq_linux_amd64"
VER=$(latest ${REPO})

curl -L https://github.com/${REPO}/releases/download/"${VER}"/"${ARCH}" > ~/.local/bin/yq
chmod +x ~/.local/bin/yq

echo "yq install completed..."
