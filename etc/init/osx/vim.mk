INSTALL_TARGETS += vim dein.vim

lua: brew
ifeq (, $(shell which lua))
	brew install lua
endif

vim: brew lua
ifeq (, $(shell brew list macvim))
	$(call LOG_INFO, vim is installing ...)
	brew install macvim --with-lua --with-override-system-vim --with-python3 > /dev/null
	$(call LOG_SUCCESS, vim is successfuly installed.)
else
	$(call LOG_INFO, $@ is OK.)
endif

dein.vim: git vim deploy
	$(call LOG_INFO, dein.vim is installing ...)
	@bash etc/init/common/dein.vim.sh $(HOME)/.config/nvim/dein > /dev/null
	vim -c "call dein#install() | q"
	$(call LOG_SUCCESS, $@ is successfuly installed.)
