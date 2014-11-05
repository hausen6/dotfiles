" joe �p�̐ݒ� "
syntax on
set modeline
set fileencodings=sjis,utf-8,euc-jp

" =========== ��{�ݒ� =========== "{{{
    " �s����\��"{{{
    :set number
    "}}}
    " �N���b�v�{�[�h���L"{{{
    set clipboard=autoselect,unnamed
    "}}}
    " �C���N�������^���T�[�`on"{{{
    set incsearch
    set ic
    "}}}
    " �ݒ�t�@�C���̃p�X�ݒ�"{{{
    let $MYVIMRC='~/_vimrc'
    let $MYGVIMRC='~/_gvimrc'
    "}}}
    " �o�b�N�A�b�v�t�@�C���̍쐬�ꏊ�ύX"{{{
    set directory=~/.vim/vimbackup/
    set backupdir=~/.vim/vimbackup/
    set undodir=~/.vim/vimbackup/
    "}}}
    " �������sOFF"{{{
    set formatoptions=q
    " set tw=0
    "}}}
    "���{��̍s�̘A�����ɂ͋󔒂���͂��Ȃ��B"{{{
    set formatoptions+=mM
    "}}}
    "���⁛�̕����������Ă��J�[�\���ʒu������Ȃ��悤�ɂ���B"{{{
    set ambiwidth=double
    "}}}
    "��ʍŌ�̍s���ł������\������B"{{{
    set display+=lastline
    set tabstop=4
    "}}}
    " ���[�h���C����on"{{{
    set modeline
    "}}}
    " �c�ɘA�Ԃ̔ԍ��� co �œ��͂���"{{{
        nnoremap <silent> co :ContinuousNumber <C-a><CR>
        vnoremap <silent> co :ContinuousNumber <C-a><CR>
        command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
    "}}}
    " Ctrl-P�ŊJ���Ă���Python �X�N���v�g�����s"{{{
        function! s:Exec()
            exe "!" . &ft . " %"
        :endfunction
        command! Exec call <SID>Exec()
        map <silent> <C-P> :call <SID>Exec()<CR>
    "}}}
    " �����̓��t��}��"{{{
        nnoremap <F6> <ESC>i<C-R>=strftime("%Y/%m/%d")<CR><CR>
    "}}}
"}}}

" =========== NeoBundle�̐ݒ� ============="{{{
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
    " �����ɃC���X�g�[���������v���O�C���̃��X�g������"{{{
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
        NeoBundleLazy 'majutsushi/tagbar', {
            \ "autoload": {
            \   'filetypes': ['python', 'python3'],
            \   },
            \ "build": {
            \   "mac": "brew install ctags",
            \   },
            \ }
        NeoBundleLazy "honza/vim-snippets",{
            \ "autoload": {
            \   'filetypes': ['vim', 'python', 'python3', 'tex', 'bat', 'sh', "cpp"],
            \    },
            \ }
        NeoBundleLazy "Shougo/neosnippet.vim",{
            \ "autoload": {
            \   'filetypes': ['vim', 'python', 'python3', 'tex', 'bat', 'sh', "cpp"],
            \    },
            \ }
        NeoBundleLazy "Shougo/neosnippet-snippets", {
            \ "autoload": {
            \   'filetypes': ['vim', 'python', 'python3', 'tex', 'bat', 'sh', "cpp"],
            \    },
            \ }
        NeoBundle "kana/vim-submode"
        NeoBundle "tpope/vim-surround"
        NeoBundle 'kana/vim-smartinput'
        NeoBundle 'h1mesuke/vim-alignta'
        NeoBundleLazy "sjl/gundo.vim", {
              \ "autoload": {
              \   "commands": ['GundoToggle'],
              \}}
        " NeoBundleLazy "scrooloose/syntastic",{
        "     \ "autoload": {
        "     \   'filetypes': ['python', 'python3'],
        "     \    },
        "     \ }
        NeoBundleLazy "osyo-manga/vim-watchdogs", {
            \ "autoload": {
                \ 'filetypes': ['python', 'python3'],
                \ },
            \}
        NeoBundle "jceb/vim-hier"
        NeoBundle "git://github.com/osyo-manga/unite-quickfix.git"
        NeoBundle 'osyo-manga/shabadou.vim'
        NeoBundle 'tyru/caw.vim'
        NeoBundle 'osyo-manga/unite-fold'
        NeoBundle 'thinca/vim-qfreplace'
		NeoBundleLazy 'Rip-Rip/clang_complete',{
            \ "autoload": {
            \   'filetypes' : ['c', 'cpp'],
            \ },
            \}
    "}}}

    " syntastic"{{{
        let g:syntastic_python_checkers = ['flake8']
        " �����w�肷��ꍇ�̓J���}��؂�
        " e.g ) let g:flake8_ignore = 'E501,W293'
        let g:flake8_ignore = 'E501'
        " �����w�肷��ꍇ�̓J���}��؂�
        " let g:syntastic_python_flake8_args = '--ignore="E501,E302"'
        let g:syntastic_python_flake8_args = '--ignore="E501"'
    "}}}

	" clang
    if neobundle#is_sourced("clang_complete")
	    let g:clang_complete_auto = 1
	    let g:clang_use_library = 1
	    let g:clang_library_path = '/usr/share/clang'
	    let g:clang_user_options = '2>/dev/null || exit 0'

	    if !exists('g:neocomplcache_force_omni_patterns')
	    		let g:neocomplcache_force_omni_patterns = {}
	    endif
	    let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->)\|\h\w*::'
    endif

    " gundo.vim"{{{
        nnoremap <Leader>un :GundoToggle<CR>
        let g:gundo_auto_preview = 0
    "}}}

    " easymotion"{{{
        " ���{��ɗL���ɂ���
        let g:EasyMotion_use_migemo = 1
    "}}}

    ""VimFiler�̐ݒ�"{{{
        let g:vimfiler_as_default_explorer = 1
        " VimFiler�g�p�̃L�[�}�b�v
        nnoremap <Leader>f :VimFilerBufferDir -split -simple -winwidth=30 -no-quit<CR>
        " e �Ń^�u�I�[�v���ɂ���
        let g:vimfiler_edit_action = 'tabopen'
        " ������cd����
        let g:vimfiler_enable_auto_cd = 1
        let g:vimfiler_safe_mode_by_default = 0
        call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
    "}}}

    " unite"{{{
        let g:unite_source_history_yank_enable = 1
    "}}}

    " quickrun"{{{
        let s:hooks = neobundle#get_hooks("vim-quickrun")
        let g:quickrun_config = {}
        function! s:hooks.on_source(bundle)
                let g:quickrun_config['_'] = {
					\ "hook/close_buffer/" : 1,
					\ "hook/inu/enable" : 1,
					\ "hook/inu/wait" : 20,
					\ "runner" : "vimproc",
					\ 'runner/vimproc/updatetime' : 10,
					\ 'hook/time/enable' : 1,
				\ }
                let g:quickrun_config['python'] = {
                    \ 'cmdopt' : '-u',
                    \ 'split' : 'vertical'
                    \ }
				let g:quickrun_config['tex'] = {
						\ 'command' : 'latexmk',
						\ 'cmdopt' : '-c',
						\ 'outputter': 'quickfix',
						\ 'outputter/error/error': 'quickfix',
						\ 'exec' : ["%c %s"],
				\}
                " ���������͉��ցC�c�������͉E�֐V�����E�C���h�E�����������
                set splitbelow
                set splitright
                " vim-watchdogs"{{{
                    "  �ۑ���������������
                    let g:watchdogs_check_BufWritePost_enables = {
                        \ "python": 1,
                        \ "python3": 1,
                    \}
                    " flake8 ���g�����V���^�b�N�X�`�F�b�N
                    let s:config = {
                        \ "python/watchdogs_checker": {
                            \ "type": "watchdogs_checker/flake8",
                        \},
                        \ "watchdogs_checker/_": {
                            \'outputter/quickfix/open_cmd': '',
                        \},
                    \}
                    call watchdogs#setup(s:config)
                    "}}}
                function! s:TexPdfView()
                    if has('win32')
						let texPdfFilename = expand('%:r')
						let synctex = expand('%')
						let texPdfFilename = fnamemodify(texPdfFilename, ':h') . '\main.pdf'
						echo texPdfFilename
							let g:TexPdfViewCommand = 'silent !start '.
									\ '"C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe" -reuse-instance "' . 
									\ texPdfFilename .
									\ '" -forward-search "' .
									\ synctex . '" ' .
									\ line('.')
					elseif has('mac') || has('macunix')
						let correntDir = expand('%:p:h')
						let correntFile = expand('%:p')
						let texPdfFilename = correntDir . '/main.pdf'
						let linenum=line('.')
						let g:TexPdfViewCommand = "!".
									\             "/Applications/Skim.app/Contents/SharedSupport/displayline " .
									\			  string(linenum) . ' ' .
									\             texPdfFilename . ' ' .
									\             correntFile
                    elseif has('unix')
                        let g:TexPdfViewCommand = '! '.
                                    \             'evince '.
                                    \             texPdfFilename
                    endif
                    execute g:TexPdfViewCommand
                endfunction
        endfunction
        nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
    ""}}}

    " jedi-vim"{{{
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
    "}}}

    " python class browser"{{{
    nnoremap <Leader>t :TagbarToggle<CR>"}}}

    " neocomplete"{{{
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
    "}}}

    " jedi-vim �� neocomplete �̘A�g"{{{
        autocmd FileType python setlocal omnifunc=jedi#completions

        if !exists('g:neocomplete#force_omni_input_patterns')
                let g:neocomplete#force_omni_input_patterns = {}
        endif
    "}}}

    " �X�j�y�b�g�̐ݒ�"{{{
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
    "}}}

    " submode�̐ݒ�"{{{
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
    "}}}

    " Neobundle �I���
" ========================================="}}}

" =========== �L�[�}�b�v ========= "{{{
let mapleader=" "
" <ESC> �� C-g �Ɋ��蓖�Ă�"{{{
inoremap <C-j> <ESC>
vnoremap <C-j> <ESC>
nnoremap <C-j> <ESC>
"}}}
" $ �� ^���g���Â炢�̂ŕύX"{{{
noremap <Leader>h ^
noremap <Leader>l $
"}}}
" �P��폜�Ȃ�"{{{
nnoremap dw diw
nnoremap cw ciw
"}}}
" jk�ł̈ړ�"{{{
nnoremap j gjzz
nnoremap k gkzz
vnoremap j gjzz
vnoremap k gkzz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
"}}}
" �����ł̈ړ�����ʒ��S��"{{{
nnoremap <c-o> <c-o>zz
nnoremap <c-i> <c-i>zz
nnoremap <c-]> <c-]>zz
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
" File ���J�������ʒ��S��
augroup OpenCentralGroup
	" this one is which you're most likely to use?
	au!
	autocmd VimEnter zz
	autocmd VimEnter zz
augroup end
"}}}
" �ȒP�Ƀy�[�W�����"{{{
nnoremap <Leader>q :tabc<CR>
nnoremap <Leader>w :write!<CR>
"}}}
" .vimrc��.gvimrc��ҏW���邽�߂�Key-mapping���`����"{{{
nnoremap <silent> <Space>ev  :<C-u>tabedit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>tabedit $MYGVIMRC<CR>
"}}}
" .vimrc��.gvimrc�̕ύX�𔽉f���邽�߂�Key-mapping���`����"{{{
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>
"}}}
" ��ʕ���"{{{
nnoremap s <Nop>
nnoremap <silent>ss :split<CR>
nnoremap <silent>sv :vsplit<CR>
nnoremap <silent>sh <C-w>h
nnoremap <silent>sj <C-w>j
nnoremap <silent>sk <C-w>k
nnoremap <silent>sl <C-w>l
"}}}
" unite"{{{
nnoremap <Leader>u<Space> :Unite<Space>
nnoremap <Leader>uf       :UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <Leader>us       :Unite bookmark<CR>
nnoremap <Leader>uy       : <C-u>Unite history/yank<CR>
nnoremap <Leader>uo       : <C-u>Unite outline<CR>
nnoremap <Leader>uq		  : <C-u>Unite quickfix<CR>
nnoremap <Leader>uz		  : <C-u>Unite fold<CR>
"}}}
" caw.vim �� keymapping"{{{
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)
"}}}
" �������ȒP�ɐ��K�\����"{{{
nnoremap / /\v
"}}}
" vim �܂肽���݊֘A"{{{
" �܂肽���݈ړ����̋���:
"    ���݂̐܂肽���݂���� -> �ړ� -> �J�� -> �܂肽���݂̐擪�Ɉړ� -> ��ʒ��S��
nnoremap zj zczjzozz
nnoremap zk zczkzo[zzz
" ���̃J�[�\���̂���܂肽���݈ȊO�͕���
nnoremap <Leader>z zMzvzz
" �܂肽���݂̍ŏ�,�Ō��
nnoremap zp [z
nnoremap zn ]z
" reload
nnoremap re :e!<CR><Leader>z<CR>
" joe �p�̐ݒ� "
syntax on
"}}}
" }}}

"  ************ �t�@�C���쐬���Ƀf�B���N�g�����쐬���� *************"{{{
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
"}}}

"  **************** �܂肽���� �p�̎����ݒ� ****************"{{{
augroup foldmethod-expr
    autocmd!
    autocmd InsertEnter * if &l:foldmethod ==# 'expr'
    \                   |   let b:foldinfo = [&l:foldmethod, &l:foldexpr]
    \                   |   setlocal foldmethod=manual foldexpr=0
    \                   | endif
    autocmd InsertLeave * if exists('b:foldinfo')
    \                   |   let [&l:foldmethod, &l:foldexpr] = b:foldinfo
    \                   | endif
augroup END
"  }}}
" Capture {{{
command!
      \ -nargs=1
      \ -complete=command
      \ Capture
      \ call Capture(<f-args>)
 
function! Capture(cmd)
  redir => result
  silent execute a:cmd
  redir END
 
  let bufname = 'Capture: ' . a:cmd
  new
  setlocal bufhidden=unload
  setlocal nobuflisted
  setlocal buftype=nofile
  setlocal noswapfile
  silent file `=bufname`
  silent put =result
  1,2delete _
endfunction
" }}}

function! g:SetQuickrunConfig()
	g:quickrun_config = {
		\ '_': {
			\ "hook/close_buffer/" : 1,
			\ "hook/inu/enable" : 1,
			\ "hook/inu/wait" : 20,
			\ "runner" : "vimproc",
			\ 'runner/vimproc/updatetime' : 10,
			\ 'hook/time/enable' : 1,
		\},
		\ 'tex': {
			\ 'command' : 'latexmk',
			\ 'cmdopt' : '-c',
			\ 'outputter': 'quickfix',
			\ 'outputter/error/error': 'quickfix',
			\ 'exec' : ["%c %s"],
		\},
		\ 'python': {
			\ 'cmdopt' : '-u',
			\ 'split' : 'vertical',
		\ },
	\}
endfunction
"  **************** vim �p�̎����ݒ� **************** "{{{
augroup myVimrcGroup
        au!
		au QuickFixCmdPost vimgrep cw
        au BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
        au BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
        " au BufWritePre * :%s/\s\+$//e
augroup END
"}}}

"  **************** python �p�̎����ݒ� ****************"{{{
function! PythonFoldSetting(lnum)"{{{
    " foldlevel��3�܂�
    set foldnestmax=3

    " ���݂̍s
    let line = getline(a:lnum)
    let ind  = indent(a:lnum)
    let flev = foldlevel(a:lnum)

    " ���̍s
    let line1 = getline(a:lnum + 1)

    " ���̔��s
    let nind = indent( nextnonblank(a:lnum + 1) )

    " Classes and functions get their own folds
    if line =~ '^\s*\(class\|def\)\s'
        return '>'. (ind / &sw + 1)
    elseif ind > nind && empty(line1) && (nind / &sw + 1) == 1
        return '<'.1
    elseif ind > nind && empty(line1) && (nind / &sw + 1) == 2
        return '<2'
    elseif ind > nind && empty(line1) && (nind / &sw + 1) == 3
        return '<3'
    else
        return '='
    endif
endfunction
"}}}
function! PythonFoldText(lnum)"{{{
    let line = getline(v:foldstart)
    let nline = getline(v:foldstart + 1)
    let ind = indent(a:lnum)
    let dstind = ''
    for i in range(ind)
        let dstind = dstind.'-- '
    endfor
    let sub = substitute(line, '^(\s\*)', dstind, 'g')
    return v:folddashes . sub.nline
endfunction"}}}
augroup myPythonGroup
        au!
        " jedi-vim�����I����off �ɂ���"
        au BufEnter,BufNewFile,BufRead *.py call g:SetPopOnJediOff()
		" jedi-vim ��pop out ������
		au FileType python setlocal completeopt-=preview
        " class view ��ݒ�"
        " au BufNewFile,BufRead *.py :TagbarToggle
        au BufNewFile,BufRead *.py :NeoSnippetSource ~/.vim/mysnip/python.snip
        au BufEnter *.py :IndentLinesEnable
		au BufEnter *.py set tabstop=4
		au BufEnter *.py set autoindent
		au BufEnter *.py set expandtab
		au BufEnter *.py set shiftwidth=4
        " au BufWritePre *.py :%s/\s*$//
        " au BufEnter *.py set foldmethod=expr foldexpr=PythonFoldSetting(v:lnum) foldtext=PythonFoldText(v:lnum)
augroup END
"}}}

"  **************** latex �p�̎����ݒ� ****************"{{{
function! s:SetLaTeXMainSource() " latex �p�֐�{{{
	let currentFileDirectory = expand('%:p:h')
	if has('win32') || has('win64')
    	let latexmain = currentFileDirectory .'\main.tex' 
		if has_key(g:quickrun_config, 'tex')
			let g:quickrun_config['tex']['srcfile'] = latexmain
		else
			g:SetQuickrunConfig()
			let g:quickrun_config['tex']['srcfile'] = latexmain
		endif
    	let g:quickrun_config['tex']['srcfile'] = latexmain 
	elseif has('unix')
		let latexmain = currentFileDirectory . '/main.tex'
		if has_key(g:quickrun_config, 'tex')
    		let g:quickrun_config['tex']['srcfile'] = latexmain 
		else
			g:SetQuickrunConfig()
			let g:quickrun_config['tex']['srcfile'] = latexmain
		endif
	endif
endfunction " }}}
augroup myLaTeXGroup
        au!
        au BufNewFile,BufRead *.tex :NeoSnippetSource ~/.vim/mysnip/tex.snip
        au BufNewFile,BufRead *.tex filetype plugin indent off
        au BufEnter *.tex nnoremap <Leader>v :call <SID>TexPdfView() <CR>
        au BufRead *.tex call <SID>SetLaTeXMainSource()
		au BufEnter *.tex nnoremap <Leader><Leader>r :QuickRun tex<CR>
		au BufEnter *.tex set commentstring=\%\%s
augroup END
augroup myCppGroup
		autocmd!
		autocmd FileType cpp set tabstop=4
		au FileType cpp  set tabstop=4
		au FileType cpp  set autoindent
		au FileType cpp  set expandtab
		au FileType cpp  set shiftwidth=4
		au FileType cpp  set foldmethod=marker
augroup END
"}}}
" vim:set comentstrings=" %s
" vim:set foldmethod=marker: "
