DOTPATH        := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
EXCLUDES       := .git .gitignore .gitattribute .gitmodules
TARGETS        := $(wildcard .??*)
DOTFILES_FILES := $(filter-out $(EXCLUDES), $(TARGETS))
HOME_DIR       := $(abspath $(HOME))
INSTALL_TARGETS +=



all: deploy

deploy:
	@$(foreach file, $(DOTFILES_FILES), ln -snvf $(abspath $(file)) $(HOME_DIR)/$(file);)

simple_deploy:
	@$(foreach file, $(DOTFILES_FILES), ln -snf $(abspath $(file)) $(HOME_DIR)/$(file);)

include etc/lib/log.mk
include etc/init/common/*.mk

ifeq ($(OS), Windows_NT)
	$(eval include etc/windows/*.mk)
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S), Darwin)
		include etc/init/osx/*.mk
	endif
endif

init: $(INSTALL_TARGETS)

update:
	git pull origin master
	git submodule init
	git submodule update --recursive

clean:
	@$(foreach file, $(DOTFILES_FILES), rm -f $(HOME_DIR)/$(file);)
