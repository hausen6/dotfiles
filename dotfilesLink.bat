:: シンボリックリンクを作成するbat(for windows)
@echo off

rem *********** pathのセット **************
rem vimrcのパスをセット
set VIMRC=%~dp0_vimrc
echo %VIMRC%
rem gvimrcのパスをセット
set GVIMRC=%~dp0_gvimrc
echo %GVIMRC%
rem .latexmkrcのパスをセット
set latexmkrc=%~dp0.latexmkrc
echo %latexmkrc%
rem スニペット用フォルダ mysnip のパスをセット
set MYSNIP=%~dp0mysnip
echo %MYSNIP%
echo %~dp0
rem *********** pathのセット **************

rem ディレクトリ移動
echo %USERPROFILE%
cd %USERPROFILE%

rem 既にリンクが作成されていた場合はそのリンクを削除
if exist _vimrc del _vimrc
if exist _gvimrc del _gvimrc
if exist .latexmkrc del .latexmkrc
if exist .vim\mysnip rmdir .vim\mysnip

:mklink
rem シンボリックリンクを作成
mklink _vimrc %VIMRC%
mklink _gvimrc %GVIMRC%
mklink .latexmkrc %latexmkrc%
mklink /d .vim\mysnip %MYSNIP%

PAUSE
exit
