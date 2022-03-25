#!/bin/sh

for default in ~/.mozilla/firefox/*.default; do
    echo "Copying conf to ${default}"
    cp ./user.js "${default}"
done
