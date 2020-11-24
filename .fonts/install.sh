#!/bin/sh

cp -rv ./* ~/.fonts/
chmod 644 ~/.fonts/*

fc-cache -f -v

echo "done.."
