#! /bin/bash

# ���Ƀt�@�C��or�����N������΍폜����
if test -L ~/_vimrc; then
	rm ~/_vimrc
	echo rm _vimrc file
fi
if test -L ~/_gvimrc ; then
	rm ~/_gvimrc
	echo rm _gvimrc file
fi
if test -L ~/latexCompiler.exe ; then
	rm ~/latexCompiler.exe
	echo rm latexCompiler.exe file
fi
if test -L ~/.vim/mysnip; then
	rm -rf ~/.vim/mysnip
	echo rm ~/.vim/mysnip
fi

# �V���{���b�N�����N���쐬����
ln -s ~/dotfiles/_vimrc ~/_vimrc
ln -s ~/dotfiles/_gvimrc ~/_gvimrc
ln -s ~/dotfiles/latexCompiler.exe ~/latexCompiler.exe
ln -s ~/dotfiles/mysnip/ ~/.vim/mysnip
