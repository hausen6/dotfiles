#! /bin/bash
platex -synctex=1 -jobname="main" -kanji=utf8 -guess-input-enc main.tex && dvips "main.dvi"  && ps2pdf "main.ps"
