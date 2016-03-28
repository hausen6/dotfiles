INSTALL_TARGETS += peco

peco: go
ifeq (, $(shell which peco))
	$(call LOG_INFO, install $@ ...)
	go get github.com/peco/peco/cmd/peco
	$(call LOG_SUCCESS, $@ is OK.)
else
	$(call LOG_SUCCESS, $@ is OK.)
endif
