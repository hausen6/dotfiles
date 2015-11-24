DOTFILES_EXCLUDES = .git .gitignore .gitattribute
DOTFILES_TARGETS = $(wildcard .??*)
DOTFILES_FILES = $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGETS))
HOME_DIR = $(abspath $(HOME))

deploy:
	@$(foreach file, $(DOTFILES_FILES), ln -svf $(abspath $(file)) $(HOME_DIR)/$(file);)

clean:
	@$(foreach file, $(DOTFILES_FILES), rm -f $(HOME_DIR)/$(file);)
