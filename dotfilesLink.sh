#! /bin/sh

# 既にファイルorリンクがあれば削除する
if test -e ~/_vimrc ; then
	rm ~/_vimrc
fi
if test -e ~/_gvimrc ; then
	rm ~/_gvimrc
fi
if test -e ~/.latexmkrc ; then
	rm ~/.latexmkrc
fi

# シンボリックリンクを作成する
ln -s _vimrc ~/_vimrc
ln -s _gvimrc ~/_gvimrc
ln -s .latexmkrc ~/.latexmkrc
