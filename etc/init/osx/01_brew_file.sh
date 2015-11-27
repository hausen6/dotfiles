#!/bin/bash

trap 'echo ERROR: $0:$LINENO' SIGINT SIGTERM
set -eu

source "$DOTPATH"/etc/lib/utils.sh

if ! has "brew"; then
	log_fail "brew-file must be required to brew"
	exit 1
fi

brew install rcmdnk/file/brew-file
if [ $? -eq 0 ]; then
	export HOMEBREW_BREWFILE=$(cd $(dirname $0) && pwd)/brew_file.txt
else
	log_fail "brew-file cloud not install"
	exit 1
fi
