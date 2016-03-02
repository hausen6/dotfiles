" === dein Scripts ===
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.config/nvim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" load plugin lists from toml files
let s:plugin_toml = '~/.config/nvim/dein.toml'
let s:plugin_lazy_toml = '~/.config/nvim/dein_lazy.toml'

if dein#load_cache([expand('<sfile>'), s:plugin_toml, s:plugin_lazy_toml])
	call dein#load_toml(s:plugin_toml, {"lazy": 0})
	call dein#load_toml(s:plugin_lazy_toml, {"lazy": 1})
	call dein#save_cache()
endif

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
" if dein#check_install()
"   call dein#install()
" endif
 
" deoplete settings
let g:deoplete#enable_at_startup = 1

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" colorscheme
set background=dark
colorscheme hybrid
" === End dein Scripts ===


" === 一般的な設定  ===
" 変数宣言
let $MYVIMRC = "~/.config/nvim/init.vim"


" 行番号表示
set number

" シンタックスハイライト
syntax on

" ファイル・タイプ自動認識
filetype on

" クリップボード共有
set clipboard=unnamed

" インクリメンタルサーチ
set incsearch
set ic

" タブ量の設定
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent


" === 自作関数 ===
" 現在開いているバッファをカレントディレクトリにする
command! Cd cd %:h

" === KEY BINDING ===
" Leader を変更
let mapleader=" "

" jkでの移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz

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
nnoremap <Leader>uf :Unite file<CR>
nnoremap <Leader>gs :Unite giti/status<CR>
nnoremap <Leader>gl :Unite giti/log<CR>

" vimfiler
nnoremap <Leader>f :VimFilerExplore -split -winwidth=30 -find -no-quit<Cr>


" caw (コメントアウト切り替えプラグイン)
nmap <Leader>c <Plug>(caw:i:toggle)


" === VIM 用の自動設定 ===
augroup MyVimGroup
    au!
    au BufWritePost *.vim source $MYVIMRC
augroup END
