INSTALL_TARGETS += ghq

ghq: go
ifeq (, $(shell which ghq))
	$(call, LOG_INFO, install $@ ...)
	go get -u github.com/motemen/ghq
	$(call, LOG_SUCCESS, $@ is OK.)
else
	$(call LOG_SUCCESS, $@ is OK.)
endif
