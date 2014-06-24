#! /bin/bash

# 既にファイルorリンクがあれば削除する
if test -L ~/_vimrc; then
	rm ~/_vimrc
	echo rm _vimrc file
fi
if test -L ~/_gvimrc ; then
	rm ~/_gvimrc
	echo rm _gvimrc file
fi
if test -L ~/.latexmkrc ; then
	rm ~/.latexmkrc
	echo rm .latexmkrc file
fi

# シンボリックリンクを作成する
ln -s ~/dotfiles/_vimrc ~/_vimrc
ln -s ~/dotfiles/_gvimrc ~/_gvimrc
ln -s ~/dotfiles/.latexmkrc ~/.latexmkrc
