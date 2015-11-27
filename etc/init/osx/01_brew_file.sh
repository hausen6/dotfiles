#!/bin/bash

trap 'echo ERROR: $0:$LINENO' SIGINT SIGTERM
set -eu

source "$DOTPATH"/etc/lib/utils.sh

if ! has "brew"; then
	log_fail "brew-file must be required to brew"
	exit
fi

brew install rcmdnk/file/brew-file
