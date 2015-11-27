#!/bin/bash

trap 'echo ERROR: $0: $LINENO' SIGINT SIGTERM

. "$DOTPATH"/etc/lib/utils.sh


if has "git"; then
	# ソースのクローン
	if [ -e "${ZDOTDIR:-$HOME}/.zprezto" ]; then
		log_echo "already download zprezto"
	else
		git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
	fi

	# 必要ファイルのシンボリックリンク
	echo 'setopt EXTENDED_GLOB
	for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
		  if [[ ! -e "$rcfile" ]]; then
			  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
		  fi
	done' | zsh
else
	log_fail "to install prezto, git must be need"
	exit 1
fi
