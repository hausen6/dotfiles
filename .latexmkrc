# latexmk
$latex         = 'uplatex -synctex=1 -guess-input-enc -interaction=nonstopmode %O %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$bibtex        = 'pbibtex -kanji=utf8 %B';
$pdf_mode       = 3;
$default_files = ("main.tex"); #default target file is main.tex;
$out_dir = "build";
$pvc_view_file_via_temporary = 0;
