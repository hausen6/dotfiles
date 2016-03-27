INSTALL_TARGETS += zsh

zsh: brew
ifeq (zsh, $(shell which zsh))
	brew install zsh
else
	$(call LOG_INFO, $@ is OK.)
endif

