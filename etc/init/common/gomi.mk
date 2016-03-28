INSTALL_TARGETS += gomi

gomi: go
ifeq (, $(shell which gomi))
	$(call LOG_INFO, install $@ ...)
	go get -u github.com/b4b4r07/gomi
	$(call LOG_SUCCESS, $@ is OK.)
else
	$(call LOG_SUCCESS, $@ is OK.)
endif
