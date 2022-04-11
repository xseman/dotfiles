#!/bin/bash

for cmd in {code,}; do
    if ! command -v "${cmd}" > /dev/null; then
        echo "This script requires '${cmd}' to be installed."
        exit 1
    fi
done

cd "$(dirname "${0}")" || exit 1

file=bootstrap.sh

if [ -f ${file} ]; then
    rm ./${file}
fi

while IFS= read -r ext; do
    echo "code --install-extension ${ext}" >> ${file}
done < <(code --list-extensions)

chmod +x ./$file
