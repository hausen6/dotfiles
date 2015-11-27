#!/bin/bash

trap 'echo ERROR:$0: %LINENO' SIGINT SIGTERM
set -eu

. $DOTPATH/etc/lib/utils.sh


clone (){
	if [ ! -e $2 ]; then
		git clone https://github.com/yyuu/$1 $2
	fi
}


if has "git"; then
	# pyenv 本体
	clone pyenv ~/.pyenv
	# plugins
	clone pyenv-virtualenv ~/.pyenv/plugins/pyenv-virtualenv
	clone pyenv-pip-rehash ~/.pyenv/plugins/pyenv-pip-rehash
	clone pyenv-which-ext ~/.pyenv/plugins/pyenv-which-ext
else
	log_fail "to install pyenv, git must be needed"
	exit 1
fi
