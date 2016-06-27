" === dein Scripts ===
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Let dein manage dein
if dein#load_state(expand('~/.config/nvim/dein'))
    " Required:
    call dein#begin(expand('~/.config/nvim/dein'))

    " Required:
    call dein#add('Shougo/dein.vim')

    " load plugin lists from toml files
    let s:plugin_toml = '~/.config/nvim/dein.toml'
    let s:plugin_lazy_toml = '~/.config/nvim/dein_lazy.toml'

	call dein#load_toml(s:plugin_toml, {"lazy": 0})
	call dein#load_toml(s:plugin_lazy_toml, {"lazy": 1})
    " Required:
    call dein#end()
	call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
" if dein#check_install()
"   call dein#install()
" endif
" deoplete settings
if dein#tap('deoplete.vim') && has('nvim')
    let g:deoplete#enable_at_startup = 1
endif
if dein#tap('neocomplete.vim') && has('lua')
    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
endif

" neosnippet
if dein#tap('neosnippet.vim')
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
endif

" colorscheme
if dein#tap('vim-hybrid')
    set background=dark
    " colorscheme hybrid
endif

" golang
" vim-go
if dein#tap('vim-go')
  let g:go_fmt_command='goimports'
endif

" easy-motion
if dein#tap('vim-easymotion')
    let g:EasyMotion_use_migemo = 1
endif

" python
" jedi

" === End dein Scripts ===


" === 一般的な設定  ===
" 変数宣言
if has('nvim')
    let $MYVIMRC = "~/.config/nvim/init.vim"
else
    let $MYVIMRC = "~/.vimrc"
endif

" コマンドモードの補完を使いやすくする
set wildmenu
set wildmode=longest:full,full

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
" 現在のファイル・タイプを表示
command! ShowFiletype echo &filetype

" バッファのシンボリック先自体を開く
command! FollowSymlink call s:SwitchToActualFile()
function! s:SwitchToActualFile()
  let l:fname = resolve(expand('%:p'))
  let l:pos = getpos('.')
  let l:bufname = bufname('%')
  enew
  exec 'bw '. l:bufname
  exec "e" . fname
  call setpos('.', pos)
endfunction

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
    au BufEnter *.latex let g:tex_conceal = ''
    au Filetype latex nnoremap <Leader>t :VimtexTocOpen
augroup END
