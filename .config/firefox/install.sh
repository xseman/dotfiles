#!/bin/sh

# Your unique generated string
USER=$(ls ~/.mozilla/firefox | grep '[a-z0-9]*\.default$')

cp ./user.js ~/.mozilla/firefox/$USER/
