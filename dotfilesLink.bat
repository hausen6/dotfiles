:: �V���{���b�N�����N���쐬����bat(for windows)
@echo off

rem *********** path�̃Z�b�g **************
rem vimrc�̃p�X���Z�b�g
set VIMRC=%~p0_vimrc
echo %VIMRC%
rem gvimrc�̃p�X���Z�b�g
set GVIMRC=%~p0_gvimrc
echo %GVIMRC%
rem .latexmkrc�̃p�X���Z�b�g
set latexmkrc=%~p0.latexmkrc
echo %latexmkrc%
rem *********** path�̃Z�b�g **************

rem �f�B���N�g���ړ�
cd %USERPROFILE%

rem ���Ƀ����N���쐬����Ă����ꍇ�͂��̃����N���폜
if exist _vimrc del _vimrc
if exist _gvimrc del _gvimrc
if exist .latexmkrc del .latexmkrc

:mklink
rem �V���{���b�N�����N���쐬
mklink _vimrc %VIMRC%
mklink _gvimrc %GVIMRC%
mklink .latexmkrc %latexmkrc%

PAUSE
exit
