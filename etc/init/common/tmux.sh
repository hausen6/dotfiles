#!/bin/bash

trap 'echo ERROR:$0: %LINENO' SIGINT SIGTERM
set -eu

. $DOTPATH/etc/lib/utils.sh

# 成功判断のためのbitフラグ変数
TMUX_SUCCESS=0
PLUGIN_SUCCESS=0

if has "tmux"; then
	log_echo "already installed tmux"
	TMUX_SUCCESS=1
fi

if [ $TMUX_SUCCESS -ne 1 ]; then
	# osx
	if has "brew" ; then
		log_echo "tmux install with brew"
		brew install tmux
		if [ $? -eq 0 ]; then
			log_pass "tmux successfully installed"
			TMUX_SUCCESS=1
		else
			log_fail "tmux cloud not install with brew"
			exit 1
		fi
	fi

	# ubuntu
	if has "apt-get"; then
		log_echo "tmux install with apt-get"
		apt-get install tmux 
		if [ $? -eq 0 ]; then
			log_pass "tmux successfully installed"
			SUCCESS=$(($SUCCESS | $TMUX_SUCCESS))
		else
			log_fail "tmux cloud not install with apt-get"
			exit 1
		fi
	fi
fi

# tpm
if [ -e $HOME/.tmux/plugins/tpm ]; then
	log_pass "already tmux-plugin-manager installed"
	PLUGIN_SUCCESS=1
else
	if has "git"; then
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
		if [ $? -eq 0 ]; then
			log_pass "tmux-plugin-manager successfully installed"
			SUCCESS=$(($SUCCESS | $PLUGIN_SUCCESS))
		fi
	fi
fi

if [ $TMUX_SUCCESS -eq 0 ] || [ $PLUGIN_SUCCESS -eq 0 ]; then
	log_fail "failed to tmux please check"
fi
