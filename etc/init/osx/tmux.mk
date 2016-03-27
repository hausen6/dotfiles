INSTALL_TARGETS += tmux

tmux: brew
ifeq (, $(shell which tmux))
	brew install tmux
else
	$(call LOG_INFO, $@ is OK.)
endif
