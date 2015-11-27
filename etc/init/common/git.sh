#!/bin/bash

trap 'echo ERROR: $0:$LINENO' SIGINT SIGTERM
set -eu

. "$DOTPATH"/etc/lib/utils.sh

if has "git"; then
	log_pass "already installed git"
	exit
fi

# osx
if has "brew"; then
	log_echo "git install with brew"
	brew install git && log_pass "git successfully installed" && exit 
fi

# ubuntu
if has "apt-get"; then
	log_echo "git install with apt-get"
	sudo apt-get -y install git && log_pass "git successfully installed" && exit 
fi

log_fail "ERROR: failed to install git"
