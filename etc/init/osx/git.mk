INSTALL_TARGETS += git

git: brew
ifeq (, $(shell which git))
	$(call LOG_INFO, install $@ ...)
	@brew install git
	$(call LOG_SUCCESS, $@ is OK.)
else
	$(call LOG_SUCCESS, $@ is OK.)
endif
