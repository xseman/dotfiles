#!/bin/sh

# Inspiration
# https://github.com/stark/siji/blob/master/install.sh

# Bold Colors for formatting
g="\033[1;32m" # Green
r="\033[1;31m" # Red
y="\033[1;33m" # Yellow
w="\033[1;37m" # White
rs="\033[0m"   # Reset

success() {
	printf "[${g}OK${rs}] $1 ${w}$2${rs}\n"
}

warning() {
	printf "[${y}XX${rs}] ${y}warning:${rs} $1 ${w}$2${rs}\n"
}

failure() {
	printf "[${r}XX${rs}] ${r}failed:${rs} $1 ${w}$2${rs}\n"
}

error() {
	case $1 in
		1) failure "No font specified"
	;;
		2) failure "Font not found"
	;;
		*) failure "Unknown option"
	;;
	esac
}

die() {
	"$@"
	printf "${r}\nExiting${rs}\n"
	exit 1
}

# examples

success "Installing done..."
warning "Directory not found..."
error 1
error 2
error 3
