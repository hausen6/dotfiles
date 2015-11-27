#!/bin/bash

trap 'echo ERROR: $0:$LINENO' SIGINT SIGTERM
set -eu

source "$DOTPATH"/etc/lib/utils.sh

if ! has "brew"; then
	log_fail "brew-file must be required to brew"
	exit 1
fi

if [ -e `brew --prefix`/etx/brew-wrap ]; then
	brew install rcmdnk/file/brew-file
	log_echo "already installed brew-file"
fi

if [ $? -eq 0 ]; then
	brew file install
else
	log_fail "brew-file cloud not install"
	exit 1
fi
