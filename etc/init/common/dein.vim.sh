#!/bin/sh
# Standalone installer for Unixs
# Original version is created by shoma2da
# https://github.com/shoma2da/neobundle_installer

source etc/lib/log.sh

if [ $# -ne 1 ]; then
  log_error "You must specify the installation directory!"
  exit 1
fi

# Installation directory
PLUGIN_DIR=$1
INSTALL_DIR="$PLUGIN_DIR/repos/github.com/Shougo/dein.vim"
if [ -e "$INSTALL_DIR" ]; then
  log_success "dein.vim is OK."
fi

# check git command
if [ -x "$(which git)" ]; then
  : # You have git command. No Problem.
else
  log_error 'Please install git or update your path to include the git executable!'
  exit 1
fi

# make plugin dir and fetch dein
if ! [ -e "$INSTALL_DIR" ]; then
  mkdir -p "$PLUGIN_DIR"
  git clone https://github.com/Shougo/dein.vim "$INSTALL_DIR"
  log_success "dein.vim is OK."
fi
