INSTALL_TARGETS += pyenv

pyenv: git
	@etc/init/common/pyenv.sh
