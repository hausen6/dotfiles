INSTALL_TARGETS += brew

brew:
ifeq (, $(shell which brew))
	@/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	$(call LOG_INFO, $@ is OK.)
endif
