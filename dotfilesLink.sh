#! /bin/sh

# ���Ƀt�@�C��or�����N������΍폜����
if test -e ~/_vimrc ; then
	rm ~/_vimrc
fi
if test -e ~/_gvimrc ; then
	rm ~/_gvimrc
fi
if test -e ~/.latexmkrc ; then
	rm ~/.latexmkrc
fi

# �V���{���b�N�����N���쐬����
ln -s _vimrc ~/_vimrc
ln -s _gvimrc ~/_gvimrc
ln -s .latexmkrc ~/.latexmkrc
