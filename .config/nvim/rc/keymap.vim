" === KEY BINDING ===
" <C-Space>でオムニ補完
imap <C-Space> <C-x><C-o>

" Leader を変更
let mapleader=" "

" jkでの移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
inoremap jj <ESC>

" emacs 風移動
inoremap <C-b> <LEFT>
inoremap <C-f> <RIGHT>
inoremap <C-d> <DELETE>
nnoremap <C-e> <ESC>$
inoremap <C-e> <ESC>$a
inoremap <C-a> <ESC>^i
" command modeでemacs風移動
cnoremap <C-b> <LEFT>
cnoremap <C-f> <RIGHT>
cnoremap <C-d> <DELETE>
cnoremap <C-a> <HOME>
cnoremap <C-e> <END>

" 画面分割
nnoremap s <Nop>
nnoremap <silent>ss :split<CR>
nnoremap <silent>sv :vsplit<CR>
nnoremap <silent>sh <C-w>h
nnoremap <silent>sj <C-w>j
nnoremap <silent>sk <C-w>k
nnoremap <silent>sl <C-w>l

" $ と ^が使いづらいので変更
noremap <Leader>h ^
noremap <Leader>l $

" 設定ファイルの編集
nnoremap <silent><Leader>ev :tabedit $MYVIMRC<CR>

" unite
nnoremap <Leader>uf :Unite file_rec:!<CR>
nnoremap <Leader>gs :Unite giti/status<CR>
nnoremap <Leader>gl :Unite giti/log<CR>

" vimfiler
nnoremap <Leader>f :VimFilerBufferDir -split -winwidth=30 -find -no-quit -simple<Cr>

" caw (コメントアウト切り替えプラグイン)
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)
