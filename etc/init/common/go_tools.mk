INSTALL_TARGETS += gocode
gocode: go
ifeq (, $(shell which gocode))
	$(call LOG_INFO, install $@ ...)
	go get github.com/nsf/gocode
	$(call LOG_SUCCESS, $@ is OK.)
else
	$(call LOG_SUCCESS, $@ is OK.)
endif

INSTALL_TARGETS += goimports
goimports: go
ifeq (, $(shell which goimports))
	$(call LOG_INFO, install $@ ...)
	go get golang.org/x/tools/cmd/goimports
	$(call LOG_SUCCESS, $@ is OK.)
else
	$(call LOG_SUCCESS, $@ is OK.)
endif


INSTALL_TARGETS += golint
golint: go
ifeq (, $(shell which golint))
	$(call LOG_INFO, install $@ ...)
	go get github.com/golang/lint/golint
	$(call LOG_SUCCESS, $@ is OK.)
else
	$(call LOG_SUCCESS, $@ is OK.)
endif

INSTALL_TARGETS += godef
godef: go
ifeq (, $(shell which godef))
	$(call LOG_INFO, install $@ ...)
	go get github.com/rogpeppe/godef
	$(call LOG_SUCCESS, $@ is OK.)
else
	$(call LOG_SUCCESS, $@ is OK.)
endif

