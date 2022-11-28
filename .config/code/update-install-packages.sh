#!/bin/bash

for cmd in {code,}; do
    if ! command -v "${cmd}" > /dev/null; then
        echo "This script requires '${cmd}' to be installed."
        exit 1
    fi
done

cd "$(dirname "${0}")" || exit 1

FILE=bootstrap.sh

if [ -f ${FILE} ]; then
    rm ./${FILE}
fi

while IFS= read -r extension; do
    echo "code --install-extension ${extension}" >> ${FILE}
done < <(code --list-extensions)

chmod +x ./$FILE
