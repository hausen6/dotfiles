:: �V���{���b�N�����N���쐬����bat(for windows)
@echo off

rem *********** path�̃Z�b�g **************
rem vimrc�̃p�X���Z�b�g
set VIMRC=%~dp0_vimrc
echo %VIMRC%
rem gvimrc�̃p�X���Z�b�g
set GVIMRC=%~dp0_gvimrc
echo %GVIMRC%
rem .latexmkrc�̃p�X���Z�b�g
set latexCompiler=%~dp0latexCompiler.exe
echo %latexmkrc%
rem �X�j�y�b�g�p�t�H���_ mysnip �̃p�X���Z�b�g
set MYSNIP=%~dp0mysnip
echo %MYSNIP%
echo %~dp0
rem *********** path�̃Z�b�g **************

rem �f�B���N�g���ړ�
echo %USERPROFILE%
cd %USERPROFILE%

rem ���Ƀ����N���쐬����Ă����ꍇ�͂��̃����N���폜
if exist _vimrc del _vimrc
if exist _gvimrc del _gvimrc
if exist latexCompiler.exe del latexCompiler.exe
if exist .vim\mysnip rmdir .vim\mysnip

:mklink
rem �V���{���b�N�����N���쐬
mklink _vimrc %VIMRC%
mklink _gvimrc %GVIMRC%
mklink latexCompiler.exe %latexCompiler%
mklink /d .vim\mysnip %MYSNIP%

PAUSE
exit
