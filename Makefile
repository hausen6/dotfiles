DOTPATH        := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
EXCLUDES       := .git .gitignore .gitattribute
TARGETS        := $(wildcard .??*)
DOTFILES_FILES := $(filter-out $(EXCLUDES), $(TARGETS))
HOME_DIR       := $(abspath $(HOME))

all: deploy

deploy:
	@$(foreach file, $(DOTFILES_FILES), ln -svf $(abspath $(file)) $(HOME_DIR)/$(file);)

osx:
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/init/init.sh osx

clean:
	@$(foreach file, $(DOTFILES_FILES), rm -f $(HOME_DIR)/$(file);)
