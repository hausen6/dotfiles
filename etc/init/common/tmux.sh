#!/bin/bash

trap 'echo ERROR:$0: %LINENO' SIGINT SIGTERM
set -eu

. $DOTPATH/etc/lib/utils.sh

# 成功判断のためのbitフラグ変数
SUCCESS=0
TMUX_SUCCESS=1
PLUGIN_SUCCESS=2

if has "tmux"; then
	log_pass "already installed tmux"
	SUCCESS=$(($SUCCESS | $TMUX_SUCCESS))
fi

if [ $(($SUCCESS & $TMUX_SUCCESS)) -gt 0 ]; then
	# osx
	if has "brew" ; then
		log_echo "tmux install with brew"
		brew install tmux
		if [ $? -eq 0 ]; then
			log_pass "tmux successfully installed"
			SUCCESS=$(($SUCCESS | $TMUX_SUCCESS))
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
	SUCCESS=$(($SUCCESS | $PLUGIN_SUCCESS))
else
	if has "git"; then
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
		if [ $? -eq 0 ]; then
			log_pass "tmux-plugin-manager successfully installed"
			SUCCESS=$(($SUCCESS | $PLUGIN_SUCCESS))
		fi
	fi
fi

if [ ! $SUCCESS -gt 0 ]; then
	log_fail "failed to tmux please check"
fi
