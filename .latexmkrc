# latexmk
$latex         = 'platex -kanji=utf8 -synctex=1 -guess-input-enc -interaction=nonstopmode %O %S';
$ps = 'dvipdfmx %O %S';
$bibtex        = 'pbibtex -kanji=utf8 %B';
$pdf_mode       = 2;
$default_files = ("main.tex"); #default target file is main.tex;
$out_dir = "build";
