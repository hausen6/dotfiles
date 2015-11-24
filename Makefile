DOTFILES_EXCLUDES = .git .gitignore .gitattribute
DOTFILES_TARGETS = $(wildcard .??*)
DOTFILES_FILES = $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGETS))
SNIPET_DIR = mysnip
HOME_DIR = $(abspath $(HOME))

deploy:
	@$(foreach file, $(DOTFILES_FILES), ln -svf $(abspath $(file)) $(HOME_DIR)/$(file);)
	@ln -svf $(abspath $(SNIPET_DIR)) ~/.vim/

clean:
	@$(foreach file, $(DOTFILES_FILES), rm -f $(HOME_DIR)/$(file);)
