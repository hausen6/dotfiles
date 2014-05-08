" joe �p�̐ݒ�
set noswapfile
"
" ��{�ݒ�
" �s����\��
:set number
" �N���b�v�{�[�h���L
set clipboard=autoselect,unnamed
" �C���N�������^���T�[�`on
set incsearch
set ic
" �ݒ�t�@�C���̃p�X�ݒ�
let $MYVIMRC='$HOME/.vim/bundle/dotfiles/_vimrc'
let $MYGVIMRC='$HOME/.vim/bundle/dotfiles/_gvimrc'

" �c�ɘA�Ԃ̔ԍ��� co �œ��͂���
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor

" Ctrl-P�ŊJ���Ă���Python �X�N���v�g�����s
function! s:Exec()
    exe "!" . &ft . " %"        
:endfunction         
command! Exec call <SID>Exec() 
map <silent> <C-P> :call <SID>Exec()<CR>

" =========== NeoBundle�̐ݒ� =============
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
" �����ɃC���X�g�[���������v���O�C���̃��X�g������
NeoBundleFetch 'Shougo/neobundle.vim'  

" �����̐ݒ�t�@�C��
NeoBundle 'hausen6/dotfiles'

NeoBundle 'Shougo/unite.vim'

NeoBundle 'Shougo/vimfiler.vim'
""VimFiler�̐ݒ�
let g:vimfiler_as_default_explorer = 1
" VimFiler�g�p�̃L�[�}�b�v
nnoremap <Leader>f :VimFiler -split -simple -winwidth=30 -no-quit<CR>
" e �Ń^�u�I�[�v���ɂ���
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
  " jedi��vim�̐ݒ��C�����'completeopt+=preview'����̂�
  " �����ݒ�@�\��OFF�ɂ��蓮�Őݒ���s��
  let g:jedi#auto_vim_configuration = 0
  " �⊮�̍ŏ��̍��ڂ��I�����ꂽ��Ԃ��Ǝg���ɂ������߃I�t�ɂ���
  let g:jedi#popup_select_first = 0
  " quickrun�Ɣ�邽�ߑ啶���ɕύX
  let g:jedi#rename_command = '<Leader>R'
  " gundo�Ɣ�邽�ߑ啶���ɕύX (2013-06-24 10:00 �ǋL�j
  "let g:jedi#goto_command = '<Leader>G'
endfunction

" vim-indent-guides
NeoBundle "nathanaelkane/vim-indent-guides"
let s:hooks = neobundle#get_hooks("vim-indent-guides")
function! s:hooks.on_source(bundle)
  let g:indent_guides_guide_size = 1
  IndentGuidesEnable " 2013-06-24 10:00 �ǋL
endfunction

" python class browser
NeoBundle 'majutsushi/tagbar', {
      \ "build": {
      \   "mac": "brew install ctags",
      \ }}
nnoremap <Leader>t :TagbarToggle<CR>




" �⊮
" if_lua���L���Ȃ�neocomplete���g��
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
if neobundle#is_installed('neocomplete')
    " neocomplete�p�ݒ�
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
elseif neobundle#is_installed('neocomplcache')
    " neocomplcache�p�ݒ�
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
" jedi-vim �� neocomplete �̘A�g
autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:jedi#popup_on_dot = 0

" �X�j�y�b�g�̐ݒ�
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

" submode�̐ݒ�
NeoBundle "kana/vim-submode"
" window size �̒�����A���L�[�ł��
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')


call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')
" �^�u�J�ڂ�A���ōs��
call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
call submode#map('changetab', 'n', '', 't', 'gt')
call submode#map('changetab', 'n', '', 'T', 'gT')

" soround
NeoBundle "tpope/vim-surround"
" =========================================

" **** �L�[�}�b�v ****
let mapleader=" "
" <ESC> �� C-g �Ɋ��蓖�Ă�
inoremap <C-g> <ESC>
vnoremap <C-g> <ESC>
" $ �� ^���g���Â炢�̂ŕύX
noremap <Leader>h ^
noremap <Leader>l $

" .vimrc��.gvimrc��ҏW���邽�߂�Key-mapping���`����
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>
 
" .vimrc��.gvimrc�̕ύX�𔽉f���邽�߂�Key-mapping���`����
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>
" ��ʕ���
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
" �J�b�R�Ȃǂ̓��͈ړ�
inoremap () ()<Left>
inoremap [] []<Left>
inoremap �u�v �u�v<Left>
inoremap {} {}<Left>
inoremap �y�z �y�z<Left>
" ********************
