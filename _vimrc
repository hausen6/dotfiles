" joe �p�̐ݒ� "
syntax on

" ��{�ݒ�
" �s����\��
:set number
" �N���b�v�{�[�h���L
set clipboard=autoselect,unnamed
" �C���N�������^���T�[�`on
set incsearch
set ic
" �ݒ�t�@�C���̃p�X�ݒ�
let $MYVIMRC='~/_vimrc'
let $MYGVIMRC='~/_gvimrc'
" �o�b�N�A�b�v�t�@�C���̍쐬�ꏊ�ύX
set directory=~/.vim/vimbackup/
set backupdir=~/.vim/vimbackup/
set undodir=~/.vim/vimbackup/
" �������sOFF
set formatoptions=q
"���{��̍s�̘A�����ɂ͋󔒂���͂��Ȃ��B
set formatoptions+=mM
"���⁛�̕����������Ă��J�[�\���ʒu������Ȃ��悤�ɂ���B
set ambiwidth=double
"��ʍŌ�̍s���ł������\������B
set display+=lastline

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
  set runtimepath+=~/.vim/bundle/neobundle.vim
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
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle "thinca/vim-quickrun"
NeoBundleLazy "davidhalter/jedi-vim", {
	\ "autoload": {
	\              "filetypes": ["python", "python3", "djangohtml"],
	\             },
	\ "build": {
	\              "mac": "pip install jedi",
	\              "unix": "pip install jedi",
	\ }}
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'majutsushi/tagbar', {
      \ "build": {
      \   "mac": "brew install ctags",
      \ }}
NeoBundle "honza/vim-snippets"
NeoBundle "Shougo/neosnippet.vim"
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle "kana/vim-submode"
NeoBundle "tpope/vim-surround"
NeoBundle 'kana/vim-smartinput'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundleLazy "sjl/gundo.vim", {
      \ "autoload": {
      \   "commands": ['GundoToggle'],
      \}}
NeoBundle "scrooloose/syntastic"
NeoBundle "git://github.com/osyo-manga/unite-quickfix.git"

" syntastic
let g:syntastic_python_checkers = ['flake8']
" �����w�肷��ꍇ�̓J���}��؂�
" e.g ) let g:flake8_ignore = 'E501,W293'
let g:flake8_ignore = 'E501'
" �����w�肷��ꍇ�̓J���}��؂�
" let g:syntastic_python_flake8_args = '--ignore="E501,E302"'
let g:syntastic_python_flake8_args = '--ignore="E501"'

" gundo.vim
nnoremap <Leader>un :GundoToggle<CR>
let g:gundo_auto_preview = 0

" easymotion
" ���{��ɗL���ɂ���
let g:EasyMotion_use_migemo = 1

""VimFiler�̐ݒ�
let g:vimfiler_as_default_explorer = 1
" VimFiler�g�p�̃L�[�}�b�v
nnoremap <Leader>f :VimFilerBufferDir -split -simple -winwidth=30 -no-quit<CR>
" e �Ń^�u�I�[�v���ɂ���
let g:vimfiler_edit_action = 'tabopen'
" ������cd����
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_safe_mode_by_default = 0
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')

" unite
let g:unite_source_history_yank_enable = 1

" quickrun
let s:hooks = neobundle#get_hooks("vim-quickrun")
function! s:hooks.on_source(bundle)
        let g:quickrun_config = {}
        let g:quickrun_config['_'] = {
            \ "runner" : "remote/vimproc"
            \ }
        let g:quickrun_config['python'] = {
            \ 'cmdopt' : '-u'
            \}
        let g:quickrun_config['tex'] = {
            \ 'command'               : 'latexmk'   ,
            \ 'cmdopt'                : '-pdfdvi'   ,
            \ 'outputter'             : 'quickfix'     ,
            \ 'exec'                  : ['%c %o %s'],
            \}
        function! s:SetLaTeXMainSource()
            let currentFileDirectory = expand('%:p:h').'\'
            let latexmain = glob(currentFileDirectory.'*.latexmain')
            let g:quickrun_config['tex']['srcfile'] = fnamemodify(latexmain, ':r')
            if latexmain == ''
                unlet g:quickrun_config['tex']['srcfile']
            endif
        endfunction
        function! s:TexPdfView()
            let texPdfFilename = expand('%:r').'.pdf'
            if exists("g:quickrun_config['tex']['srcfile']")
                let texPdfFilename = fnamemodify(g:quickrun_config['tex']['srcfile'], ':.:r') . '.pdf'
            endif
            if has('win32')
                let g:TexPdfViewCommand = '!start '.
                            \             '"C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe" -reuse-instance '.
                            \             texPdfFilename
            endif
            if has('unix')
                let g:TexPdfViewCommand = '! '.
                            \             'evince'.
                            \             texPdfFilename
            endif
            execute g:TexPdfViewCommand
        endfunction
endfunction
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
"
" jedi-vim
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
        " jedi��vim�̐ݒ��C�����'completeopt+=preview'����̂�
        " �����ݒ�@�\��OFF�ɂ��蓮�Őݒ���s��
        let g:jedi#auto_vim_configuration = 0
        " �⊮�̍ŏ��̍��ڂ��I�����ꂽ��Ԃ��Ǝg���ɂ������߃I�t�ɂ���
        let g:jedi#popup_select_first     = 0
        " quickrun�Ɣ�邽�ߑ啶���ɕύX

  let g:jedi#rename_command = '<Leader>R'
  " gundo�Ɣ�邽�ߑ啶���ɕύX (2013-06-24 10:00 �ǋL�j
  "let g:jedi#goto_command = '<Leader>G'
endfunction
function! g:SetPopOnJediOff()
        " �I����₪��ɑI������Ă��܂����̑Ώ�?
        let s:save_cpo = &cpo
        set cpo&vim
        if g:jedi#popup_select_first == 0
        inoremap <buffer> . .<C-R>=jedi#complete_opened() ? "" : "\<lt>C-X>\<lt>C-O>\<lt>C-P>"<CR>
        endif
        let &cpo = s:save_cpo
        unlet s:save_cpo
endfunction


" python class browser
nnoremap <Leader>t :TagbarToggle<CR>

" neocomplete
" if_lua���L���Ȃ�neocomplete���g��
if neobundle#is_installed('neocomplete')
    " neocomplete�p�ݒ�
    let g:neocomplete#enable_at_startup  = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case  = 1
    if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns   = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
elseif neobundle#is_installed('neocomplcache')
    " neocomplcache�p�ݒ�
    let g:neocomplcache_enable_at_startup  = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case  = 1
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._           = '\h\w*'
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion   = 1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C
" jedi-vim �� neocomplete �̘A�g
autocmd FileType python setlocal omnifunc=jedi#completions

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

" �X�j�y�b�g�̐ݒ�
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
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets/ ,~/.vim/mysnip/'

" submode�̐ݒ�
" window size �̒�����A���L�[�ł��
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


" Neobundle �I���
" =========================================
" python �̎������@�C��
" original http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')
endfunction

" Shift + F �Ŏ����C��
autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>

" **** �L�[�}�b�v ****
let mapleader=" "
" <ESC> �� C-g �Ɋ��蓖�Ă�
inoremap <C-j> <ESC>
vnoremap <C-j> <ESC>
nnoremap <C-j> <ESC>
" $ �� ^���g���Â炢�̂ŕύX
noremap <Leader>h ^
noremap <Leader>l $
" jk�ł̈ړ�
nnoremap j gjzz
nnoremap k gkzz
vnoremap j gjzz
vnoremap k gkzz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
nnoremap gg ggzz
nnoremap G Gzz
" �����ł̈ړ�����ʒ��S��
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
" �W�����v�����Ƃ��ɉ�ʂ𒆐S��
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" �ȒP�Ƀy�[�W�����
nnoremap <Leader>q :tabc<CR>

" .vimrc��.gvimrc��ҏW���邽�߂�Key-mapping���`����
nnoremap <silent> <Space>ev  :<C-u>tabedit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>tabedit $MYGVIMRC<CR>

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
nnoremap <Leader>u<Space> : Unite<Space>
nnoremap <Leader>uf       : UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <Leader>us       : Unite bookmark<CR>
nnoremap <Leader>uy       : <C-u>Unite history/yank<CR>
nnoremap <Leader>uo       : <C-u>Unite outline<CR>

" ********************
set foldmethod=expr
set modeline
command! Evimrc e $MYVIMRC

" vimrc, gvimrc �������ǂݍ���
augroup myVimrcGroup
        au!
        au BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
        au BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
        au BufWritePre * :%s/\s\+$//e
augroup END
"  ************ �t�@�C���쐬���Ƀf�B���N�g�����쐬���� *************
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END
"  **************** python �p�̎����ݒ� ****************
augroup myPythonGroup
        au!
        " jedi-vim�� ���I����off �ɂ���"
        au BufNewFile,BufRead *.py :call g:SetPopOnJediOff()
        " class view ��ݒ�"
        au BufNewFile,BufRead *.py :TagbarToggle
        au BufNewFile,BufRead *.py :NeoSnippetSource ~/.vim/mysnip/python.snip
augroup END
"  **************** latex �p�̎����ݒ� ****************
augroup myLaTeXGroup
        au!
        au BufNewFile,BufRead *.tex :NeoSnippetSource ~/.vim/mysnip/tex.snip
        au BufNewFile,BufRead *.tex filetype plugin indent off
        au BufEnter *.tex call <SID>SetLaTeXMainSource()
        au BufEnter *.tex nnoremap <Leader>v :call <SID>TexPdfView() <CR>
augroup END
