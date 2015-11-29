#!/bin/bash

trap 'echo ERROR:$0: %LINENO' SIGINT SIGTERM
set -eu

. $DOTPATH/etc/lib/utils.sh

if has "peco"; then
	log_echo "already installed peco"
	exit
fi

case "$OSTYPE" in
	darwin*)
		if has "brew"; then
			brew tap peco/peco
			brew install peco
		fi
		;;
	linux*)
		if ! has "go"; then
			if has "apt-get"; then
				# go のインストール
				sudo apt-get install golang
			fi
		fi
		go get github.com/peco/peco/cmd/peco
		;;
	*)
		echo "$OSTYPE Didn't match anything"
esac
