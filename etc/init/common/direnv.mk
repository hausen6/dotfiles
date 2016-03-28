INSTALL_TARGETS += direnv

direnv: go
ifeq (, $(shell which direnv))
	$(call LOG_INFO, install $@ ...)
	go get github.com/direnv/direnv
	$(call LOG_SUCCESS, $@ is OK.)
else
	$(call LOG_SUCCESS, $@ is OK.)
endif
