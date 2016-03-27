INSTALL_TARGETS += zprezto
zprezto: git
	@etc/init/common/zsh.prezto.sh 
	$(call LOG_INFO, prezto is OK.)
