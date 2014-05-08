" joe 用の設定
set noswapfile
"
" 基本設定
" 行数を表示
:set number
" クリップボード共有
set clipboard=autoselect,unnamed
" インクリメンタルサーチon
set incsearch
set ic
" 設定ファイルのパス設定
let $MYVIMRC='$HOME/.vim/bundle/dotfiles/_vimrc'
let $MYGVIMRC='$HOME/.vim/bundle/dotfiles/_gvimrc'

" 縦に連番の番号を co で入力する
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor

" Ctrl-Pで開いているPython スクリプトを実行
function! s:Exec()
    exe "!" . &ft . " %"        
:endfunction         
command! Exec call <SID>Exec() 
map <silent> <C-P> :call <SID>Exec()<CR>

" =========== NeoBundleの設定 =============
let g:neobundle_default_git_protocol='https'
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=C:\Users\joe/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif
filetype plugin indent on
" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif
" ここにインストールしたいプラグインのリストを書く
NeoBundleFetch 'Shougo/neobundle.vim'  

" 自分の設定ファイル
NeoBundle 'hausen6/dotfiles'

NeoBundle 'Shougo/unite.vim'

NeoBundle 'Shougo/vimfiler.vim'
""VimFilerの設定
let g:vimfiler_as_default_explorer = 1
" VimFiler使用のキーマップ
nnoremap <Leader>f :VimFiler -split -simple -winwidth=30 -no-quit<CR>
" e でタブオープンにする
let g:vimfiler_edit_action = 'tabopen'

call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'h1mesuke/unite-outline'
"
" quickrun
NeoBundle "thinca/vim-quickrun"
let s:hooks = neobundle#get_hooks("vim-quickrun")
function! s:hooks.on_source(bundle)
  let g:quickrun_config = 
  \   {
      \ "*"      : { "runner"                 : "remote/vimproc"},
      \ "python" : { "cmdopt"                 : "-u"},
      \   "_"    : { "outputter/buffer/split" : ":botright"},
  \   }
endfunction
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
"
" jedi-vim
NeoBundleLazy "davidhalter/jedi-vim", {
\ "autoload": {
\              "filetypes": ["python", "python3", "djangohtml"],
\             },
\ "build": {
\              "mac": "pip install jedi",
\              "unix": "pip install jedi",
\ }}
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
  " jediにvimの設定を任せると'completeopt+=preview'するので
  " 自動設定機能をOFFにし手動で設定を行う
  let g:jedi#auto_vim_configuration = 0
  " 補完の最初の項目が選択された状態だと使いにくいためオフにする
  let g:jedi#popup_select_first = 0
  " quickrunと被るため大文字に変更
  let g:jedi#rename_command = '<Leader>R'
  " gundoと被るため大文字に変更 (2013-06-24 10:00 追記）
  "let g:jedi#goto_command = '<Leader>G'
endfunction

" vim-indent-guides
NeoBundle "nathanaelkane/vim-indent-guides"
let s:hooks = neobundle#get_hooks("vim-indent-guides")
function! s:hooks.on_source(bundle)
  let g:indent_guides_guide_size = 1
  IndentGuidesEnable " 2013-06-24 10:00 追記
endfunction

" python class browser
NeoBundle 'majutsushi/tagbar', {
      \ "build": {
      \   "mac": "brew install ctags",
      \ }}
nnoremap <Leader>t :TagbarToggle<CR>




" 補完
" if_luaが有効ならneocompleteを使う
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
if neobundle#is_installed('neocomplete')
    " neocomplete用設定
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
elseif neobundle#is_installed('neocomplcache')
    " neocomplcache用設定
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C
" jedi-vim と neocomplete の連携
autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:jedi#popup_on_dot = 0

" スニペットの設定
NeoBundle "honza/vim-snippets"
NeoBundle "Shougo/neosnippet.vim"
let s:hooks = neobundle#get_hooks("neosnippet.vim")
" Plugin key-mappings.
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
NeoBundle "Shougo/neosnippet-snippets"

" submodeの設定
NeoBundle "kana/vim-submode"
" window size の調整を連続キーでやる
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')


call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')
" タブ遷移を連続で行う
call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
call submode#map('changetab', 'n', '', 't', 'gt')
call submode#map('changetab', 'n', '', 'T', 'gT')

" soround
NeoBundle "tpope/vim-surround"
" =========================================

" **** キーマップ ****
let mapleader=" "
" <ESC> を C-g に割り当てる
inoremap <C-g> <ESC>
vnoremap <C-g> <ESC>
" $ と ^が使いづらいので変更
noremap <Leader>h ^
noremap <Leader>l $

" .vimrcや.gvimrcを編集するためのKey-mappingを定義する
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>
 
" .vimrcや.gvimrcの変更を反映するためのKey-mappingを定義する
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>
" 画面分割
nnoremap s <Nop>
nnoremap <silent>ss :split<CR>
nnoremap <silent>sv :vsplit<CR>
nnoremap <silent>sh <C-w>h
nnoremap <silent>sj <C-w>j
nnoremap <silent>sk <C-w>k
nnoremap <silent>sl <C-w>l
" unite
nnoremap <Leader>u<Space> :Unite<Space>
nnoremap <Leader>uf       :UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <Leader>us       :Unite bookmark<CR>
" カッコなどの入力移動
inoremap () ()<Left>
inoremap [] []<Left>
inoremap 「」 「」<Left>
inoremap {} {}<Left>
inoremap 【】 【】<Left>
" ********************
