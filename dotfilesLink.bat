:: シンボリックリンクを作成するbat(for windows)
@echo off

rem *********** pathのセット **************
rem vimrcのパスをセット
set VIMRC=%~p0_vimrc
echo %VIMRC%
rem gvimrcのパスをセット
set GVIMRC=%~p0_gvimrc
echo %GVIMRC%
rem .latexmkrcのパスをセット
set latexmkrc=%~p0.latexmkrc
echo %latexmkrc%
rem *********** pathのセット **************

rem ディレクトリ移動
cd %USERPROFILE%

rem 既にリンクが作成されていた場合はそのリンクを削除
if exist _vimrc del _vimrc
if exist _gvimrc del _gvimrc
if exist .latexmkrc del .latexmkrc

:mklink
rem シンボリックリンクを作成
mklink _vimrc %VIMRC%
mklink _gvimrc %GVIMRC%
mklink .latexmkrc %latexmkrc%

PAUSE
exit
