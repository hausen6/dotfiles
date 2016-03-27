INSTALL_TARGETS += git

git: brew
ifeq (, $(shell which git))
	@brew install git
else
	$(call LOG_INFO, $@ is OK.)
endif
