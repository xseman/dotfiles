#!/bin/bash

if [ ! "$(command -v code)" ]; then
    echo "code could not be found"
    exit 1
fi

INSTALL=extensions_install.sh

if [ -f ${INSTALL} ]; then
    rm ${INSTALL}
fi

echo "#!/bin/bash\nset -e\n" > ${INSTALL}

code --list-extensions |
    xargs -L 1 echo code --install-extension >> ${INSTALL}

chmod +x ${INSTALL}
