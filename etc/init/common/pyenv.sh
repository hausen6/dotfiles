#!/bin/bash

source etc/lib/log.sh

# pyenv 本体
if [ -e $HOME/.pyenv ]; then
    log_success "pyenv is OK."
else
    log_info "pyenv install..."
	git clone https://github.com/yyuu/pyenv ~/.pyenv
    log_success "pyenv is OK."
fi

# pyenv-virtualenv
if [ -e $HOME/.pyenv/plugins/pyenv-virtualenv ]; then
    log_success "pyenv-virtualenv is OK."
else
    log_info "pyenv-virtualenv install..."
	git clone https://github.com/yyuu/pyenv-virtualenv ~/.pyenv/plugins/pyenv-virtualenv
    log_success "pyenv-virtualenv is OK."
fi

# pyenv-pip-rehash
if [ -e $HOME/.pyenv/plugins/pyenv-pip-rehash ]; then
    log_success "pyenv-rehash is OK."
else
    log_info "pyenv-rehash install..."
	git clone https://github.com/yyuu/pyenv-pip-rehash ~/.pyenv/plugins/pyenv-pip-rehash
    log_success "pyenv-rehash is OK."
fi
