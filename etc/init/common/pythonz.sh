#!/bin/bash

trap 'echo ERROR:$0: %LINENO' SIGINT SIGTERM
set -eu

. $DOTPATH/etc/lib/utils.sh

if [ -x "$(which pythonz)" ]; then
	log_echo "already installed peco"
	exit 0
fi

curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash
