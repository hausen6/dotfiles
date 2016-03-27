INSTALL_TARGETS += go

go: brew
ifeq (, $(shell which go))
	@brew install go
else
	$(call LOG_INFO, $@ is OK.)
endif
