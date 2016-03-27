INSTALL_TARGETS += gocode
gocode: go
ifeq (, $(shell which gocode))
	go get github.com/nsf/gocode
else
	$(call LOG_INFO, $@ is OK.)
endif

INSTALL_TARGETS += goimports
goimports: go
ifeq (, $(shell which goimports))
	go get golang.org/x/tools/cmd/goimports
else
	$(call LOG_INFO, $@ is OK.)
endif


INSTALL_TARGETS += golint
golint: go
ifeq (, $(shell which golint))
	go get github.com/golang/lint/golint
else
	$(call LOG_INFO, $@ is OK.)
endif

INSTALL_TARGETS += godef
godef: go
ifeq (, $(shell which godef))
	go get github.com/rogpeppe/godef
else
	$(call LOG_INFO, $@ is OK.)
endif

