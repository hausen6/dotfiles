DOTFILES_EXCLUDES = .git .gitignore .gitattribute
DOTFILES_TARGETS = $(wildcard .??*)
DOTFILES_FILES = $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGETS))
HOME_DIR = $(abspath $(HOME))

deploy:
	@$(foreach file, $(DOTFILES_FILES), ln -svi $(abspath $(file)) $(HOME_DIR)/$(file);)
