@echo off
::platex -synctex=1 -jobname="%~n1" -kanji=utf8 -guess-input-enc %1 && dvi2ps "%~n1" > "%~n1.ps"  && ps2pdf "%~n1.ps" 
platex -synctex=1 -jobname="main" -kanji=utf8 -guess-input-enc main.tex && dvips "main.dvi"  && ps2pdf "main.ps" 
::platex -synctex=1 -jobname="%~n1" -kanji=utf8 -guess-input-enc %1 && dvipdfmx "%~n1"
