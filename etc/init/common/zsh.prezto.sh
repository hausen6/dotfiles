#!/bin/bash

trap 'echo ERROR: $0: $LINENO' SIGINT SIGTERM

source etc/lib/log.sh

# ソースのクローン
if [ -e "${ZDOTDIR:-$HOME}/.zprezto" ]; then
    log_success "prezto is OK."
    exit 0
else
    log_info "install prezto ..."
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

# 必要ファイルのシンボリックリンク
echo 'setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      if [[ ! -e "$rcfile" ]]; then
          ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
      fi
done' | zsh

log_success "prezto is OK."
