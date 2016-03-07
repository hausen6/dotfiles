#!/bin/bash

trap 'echo ERROR:$0: %LINENO' SIGINT SIGTERM
set -eu

. $DOTPATH/etc/lib/utils.sh

if [ -x "$(which go)" ]; then
    log_echo 'already installed go-lang'
    exit 0
fi

if [ -x "$(which brew)" ]; then
    log_fail 'to install go-lang needs brew command'
    exit 1
fi

brew install go
