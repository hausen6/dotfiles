INSTALL_TARGETS += vim

lua: brew
ifeq (, $(shell which lua))
	brew install lua
endif

vim: brew lua
ifeq (, $(shell brew list macvim))
	brew install macvim --with-lua --with-override-system-vim --with-python3
else
	$(call LOG_INFO, vim is OK.)
endif
