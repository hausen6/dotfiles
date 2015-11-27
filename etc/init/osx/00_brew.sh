#!/bin/bash

# homebrew をインストールするためのスクリプト
trap 'echo ERROR: $0:$LINENO' SIGINT SIGTERM
set -eu

source "$DOTPATH"/etc/lib/utils.sh

if has "brew"; then
	log_echo "already installed brew"
	exit
fi

# install brew
log_echo "brew install with ruby"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

if has "brew"; then
	brew doctor
else
	log_fail "ERROR: brew failed to install"
	exit 1
fi

log_pass "brew successfully installed"
