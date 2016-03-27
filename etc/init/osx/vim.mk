INSTALL_TARGETS += vim

lua: brew
ifeq (, $(shell which lua))
	brew install lua
endif

vim: brew lua
ifeq (, $(shell which vim))
	brew install vim --with-lua
else
	$(call LOG_INFO, vim is OK.)
endif
