INSTALL_TARGETS += peco

peco: go
ifeq (, $(shell which peco))
	go get github.com/peco/peco/cmd/peco
else
	$(call LOG_INFO, $@ is OK.)
endif
