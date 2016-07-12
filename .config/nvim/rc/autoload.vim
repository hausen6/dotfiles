" === VIM 用の自動設定 ===
augroup MyVimGroup
    au!
    " バッファを開いた時に自動判別
    " au BufEnter * if findfile(expand('%')) != "" && resolve(expand('%:p')) != getcwd().'/'.expand('%') | execute ':FollowSymlink' | endif
    " vimrc更新時に自動で設定を更新
    au BufWritePost *vimrc source $MYVIMRC
    au BufWritePost *.vim source $MYVIMRC
    " make, grep時に対象があればquickfixを自動で開く
    au QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen | endif
    au BufWritePost *vimrc echo "reloading vimrc"
augroup END

" === Pyhon 用の自動設置 ===
augroup MyPythonGroup
    au!
    " 後ろのスペースを削除
    au BufWritePre *.py :FixWhitespace
augroup END

" === reSt 用の設定 ===
augroup MyRSTGroup
    autocmd!
    autocmd BufRead,BufWritePre *.rst set foldmethod=marker
    autocmd BufRead,BufWritePost *.rst set tabstop=2 
    autocmd BufRead,BufWritePost *.rst set shiftwidth=2 
    autocmd BufRead,BufWritePost *.rst set softtabstop=2
    autocmd BufWritePre *.rst :FixWhitespace
augroup END

" === latex用の設定 ===
augroup MyTexGroup
    autocmd!
    au BufEnter *.tex set filetype=tex
    au Filetype tex let g:tex_conceal = ''
    au Filetype tex nnoremap <Leader>t :VimtexTocOpen
    au Filetype tex let &formatprg="pandoc --from=rst --to=latex --listings"
augroup END
