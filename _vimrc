" joe 用の設定 "
syntax on
set modeline
set fenc=utf-8
set fileencodings=utf-8,sjis

" =========== 基本設定 =========== 
    " 行数を表示
    :set number
    
    " backspace で文字を消す
    set backspace=indent,eol,start
    
    " クリップボード共有
    set clipboard=autoselect,unnamed
    
    " インクリメンタルサーチon
    set incsearch
    set ic
    
    " 設定ファイルのパス設定
    let $MYVIMRC='~/_vimrc'
    let $MYGVIMRC='~/_gvimrc'
    
    " バックアップファイルの作成場所変更
    set directory=~/.vim/vimbackup/
    set backupdir=~/.vim/vimbackup/
    set undodir=~/.vim/vimbackup/
    
    " 自動改行OFF
    set formatoptions=q
    " set tw=0
    
    "日本語の行の連結時には空白を入力しない。
    set formatoptions+=mM
    
    "□や○の文字があってもカーソル位置がずれないようにする。
    set ambiwidth=double
    
    "画面最後の行をできる限り表示する。
    set display+=lastline
    set tabstop=4
    set shiftwidth=4
    
    " モードラインをon
    set modeline
    
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
    
    " 今日の日付を挿入
        nnoremap <F6> <ESC>i<C-R>=strftime("%Y/%m/%d")<CR><CR>
    


" =========== NeoBundleの設定 =============
    let g:neobundle_default_git_protocol='https'
    set nocompatible
    filetype off
    if has('vim_starting')
      set runtimepath+=C:\Users\joe/.vim/bundle/neobundle.vim
      set runtimepath+=~/.vim/bundle/neobundle.vim
      " call neobundle#rc(expand('~/.vim/bundle'))
      call neobundle#begin(expand('~/.vim/bundle'))
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
        NeoBundle 'Shougo/unite-outline'
        NeoBundle 'Shougo/vimfiler.vim'
		NeoBundle 'kmnk/vim-unite-giti'
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
            \   'filetypes': ['python', 'python3', 'cpp', 'c'],
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
            \   'filetypes': ['vim', 'python', 'python3', 'tex', 'bat', 'sh', "cpp", "txt"],
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
        NeoBundleLazy "scrooloose/syntastic",{
            \ "autoload": {
            \   'filetypes': ['python', 'python3'],
            \    },
            \ }
        NeoBundle "jceb/vim-hier"
        NeoBundle "git://github.com/osyo-manga/unite-quickfix.git"
        NeoBundle 'osyo-manga/shabadou.vim'
        NeoBundle 'tyru/caw.vim'
        NeoBundle 'osyo-manga/unite-fold'
        NeoBundle 'thinca/vim-qfreplace'
		NeoBundleLazy 'osyo-manga/vim-marching', {
			\ "autoload": {
				\ "filetypes": ["c", "cpp"],
			\ },
		\}
		NeoBundle 'osyo-manga/vim-reunions'
		NeoBundle 'taketwo/vim-ros'
		NeoBundle 'rcmdnk/vim-markdown.git'
		NeoBundle 'mattn/webapi-vim'
		NeoBundle 'tyru/open-browser.vim'
		NeoBundle 'superbrothers/vim-quickrun-markdown-gfm'
		NeoBundle 'kannokanno/previm'
		NeoBundle 'thinca/vim-singleton'
        " html/css/javascripts
        NeoBundleLazy 'mattn/emmet-vim', {
            \ "autoload": {
                \ "filetype": ["html", "css"],
                \}
        \}
        NeoBundleLazy 'hail2u/vim-css3-syntax', {
            \ "autoload": {
                \ "filetype": ["html", "css"],
                \}
        \}
        NeoBundleLazy 'pangloss/vim-javascript', {
            \ "autoload": {
                \ "filetype": ["html", "css", "javascript"],
                \}
        \}
        NeoBundleLazy 'taichouchou2/html5.vim', {
            \ "autoload": {
                \ "filetype": ["html", "css", "js"],
                \}
        \}
        NeoBundleLazy 'marijnh/tern_for_vim', {
            \ "autoload": {
                \ "filetype": ["html", "css", "js"],
                \}
        \}
        NeoBundleLazy 'lilydjwg/colorizer', {
            \ "autoload": {
                \ "filetype": ["html", "css", "js"],
                \}
        \}
        NeoBundleLazy 'pasela/unite-webcolorname', {
            \ "autoload": {
                \ "filetype": ["html", "css", "js"],
                \}
        \}
    
    "
    NeoBundleCheck
    call neobundle#end()

    " markdown
    let g:vim_markdown_folding_disabled=1

    " syntastic
        let g:syntastic_python_checkers = ['flake8']
        " 複数指定する場合はカンマ区切り
        " e.g ) let g:flake8_ignore = 'E501,W293'
        let g:flake8_ignore = 'E501'
        " 複数指定する場合はカンマ区切り
        " let g:syntastic_python_flake8_args = '--ignore="E501,E302"'
        let g:syntastic_python_flake8_args = '--ignore="E501"'
    

		" marching
		let g:marching_clang_command = "clang++"
		let g:marching_clang_command_option = "-std=c++11"
		let g:marching_include_paths = [
								\ "/usr/include/",
								\ "/usr/local/include/",
								\ "/opt/ros/hydro/include/ros",
								\]
        let g:marching_enable_neocomplete = 1
        if neobundle#is_installed("neocomplete")
            if !exists('g:neocomplete#force_omni_input_patterns')
                let g:neocomplete#force_omni_input_patterns = {}
            endif
            let g:neocomplete#force_omni_input_patterns.cpp =
                    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
        else 
            if !exists('g:neocomplcache_force_omni_patterns')
                let g:neocomplcache_force_omni_patterns = {}
            endif
            let g:neocomplcache_force_omni_patterns.cpp = 
                    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
        endif
        

    " gundo.vim
        nnoremap <Leader>un :GundoToggle<CR>
        let g:gundo_auto_preview = 0
    

    " easymotion
        " 日本語に有効にする
        let g:EasyMotion_use_migemo = 1
    

    ""VimFilerの設定
        let g:vimfiler_as_default_explorer = 1
        " VimFiler使用のキーマップ
        nnoremap <Leader>f :VimFilerBufferDir -split -simple -winwidth=30 -no-quit<CR>
        " e でタブオープンにする
        let g:vimfiler_edit_action = 'tabopen'
        " 自動でcdする
        let g:vimfiler_enable_auto_cd = 1
        let g:vimfiler_safe_mode_by_default = 0
        call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
    

    " unite
        let g:unite_source_history_yank_enable = 1
    

    " quickrun
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
                " 横分割時は下へ，縦分割時は右へ新しいウインドウが生成される
                set splitbelow
                set splitright
                function! g:TexPdfView()
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
						let g:TexPdfViewCommand = "silent !".
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
    "

    " jedi-vim
        let s:hooks = neobundle#get_hooks("jedi-vim")
        function! s:hooks.on_source(bundle)
                " jediにvimの設定を任せると'completeopt+=preview'するので
                " 自動設定機能をOFFにし手動で設定を行う
                let g:jedi#auto_vim_configuration = 0
                " 補完の最初の項目が選択された状態だと使いにくいためオフにする
                let g:jedi#popup_select_first     = 0
                " quickrunと被るため大文字に変更

          let g:jedi#rename_command = '<Leader>R'
          " gundoと被るため大文字に変更 (2013-06-24 10:00 追記）
          "let g:jedi#goto_command = '<Leader>G'
        endfunction
        function! g:SetPopOnJediOff()
                " 選択候補が常に選択されてしまう問題の対処?
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
        " if_luaが有効ならneocompleteを使う
        if neobundle#is_installed('neocomplete')
            " neocomplete用設定
            let g:neocomplete#enable_at_startup  = 1
            let g:neocomplete#enable_ignore_case = 1
            let g:neocomplete#enable_smart_case  = 1
            if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns   = {}
            endif
            let g:neocomplete#keyword_patterns._ = '\h\w*'
        elseif neobundle#is_installed('neocomplcache')
            " neocomplcache用設定
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
    

    " jedi-vim と neocomplete の連携
        autocmd FileType python setlocal omnifunc=jedi#completions

        if !exists('g:neocomplete#force_omni_input_patterns')
                let g:neocomplete#force_omni_input_patterns = {}
        endif
    

    " スニペットの設定
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
    

    " submodeの設定
        " window size の調整を連続キーでやる
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
    

    " Neobundle 終わり
" =========================================

" =========== キーマップ ========= 
let mapleader=" "
" <ESC> を C-g に割り当てる
inoremap <C-j> <ESC>
vnoremap <C-j> <ESC>
nnoremap <C-j> <ESC>

" $ と ^が使いづらいので変更
noremap <Leader>h ^
noremap <Leader>l $

" 単語削除など
nnoremap dw diw
nnoremap cw ciw

" jkでの移動
nnoremap j gjzz
nnoremap k gkzz
vnoremap j gjzz
vnoremap k gkzz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz

" insert mode時に emacs 風キーバインド
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-e> <ESC><S-a>
inoremap <C-a> <ESC><S-i>
inoremap <C-d> <DEL>
inoremap <C-h> <BS>

" 検索での移動を画面中心に
nnoremap <c-o> <c-o>zz
nnoremap <c-i> <c-i>zz
nnoremap <c-]> <c-]>zz
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
" File を開いたら画面中心に
" augroup OpenCentralGroup
" 	" this one is which you're most likely to use?
" 	au!
" 	autocmd VimEnter zz
" 	autocmd VimEnter zz
" augroup end

" .vimrcや.gvimrcを編集するためのKey-mappingを定義する
nnoremap <silent> <Space>ev  :<C-u>tabedit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>tabedit $MYGVIMRC<CR>

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
nnoremap <Leader>uy       : <C-u>Unite history/yank<CR>
nnoremap <Leader>uo       : <C-u>Unite -vertical -winwidth=30 -no-quit outline<CR>
nnoremap <Leader>uq		  : <C-u>Unite quickfix<CR>
nnoremap <Leader>uz		  : <C-u>Unite fold<CR>
nnoremap <Leader>ugb	  : <C-u>Unite giti/branch<CR>
nnoremap <Leader>ugs	  : <C-u>Unite giti/status<CR>

" caw.vim の keymapping
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

" 検索を簡単に正規表現に
nnoremap / /\v

" vim 折りたたみ関連
" 折りたたみ移動時の挙動:
"    現在の折りたたみを閉じる -> 移動 -> 開く -> 折りたたみの先頭に移動 -> 画面中心に
nnoremap zj zczjzozz
nnoremap zk zczkzo[zzz
" 今のカーソルのある折りたたみ以外は閉じる
nnoremap <Leader>z zMzvzz
" 折りたたみの最初,最後へ
nnoremap zp [z
nnoremap zn ]z
" reload
nnoremap re :e!<CR><Leader>z<CR>
" joe 用の設定 "
syntax on

" Mac だと\がAlt+\しないとでないのでmappingを変更
if has("mac")
	inoremap \ \
endif
" 

"  ************ ファイル作成時にディレクトリも作成する *************
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


"  **************** 折りたたみ 用の自動設定 ****************
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
"  
" Capture 
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
" 

function! g:SetQuickrunConfig()
	let g:quickrun_config = {
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
			\ 'outputter': 'quickfix',
			\ 'outputter/error/error': 'quickfix',
			\ 'exec' : ["%c %s"],
		\},
		\ 'python': {
			\ 'cmdopt' : '-u',
			\ 'split' : 'vertical',
		\ },
		\ 'markdown': {
			\ 'type': 'markdown/gfm',
			\ 'outputter': 'browser',
		\},
	\}
endfunction

"  **************** vim 用の自動設定 **************** 
augroup myVimrcGroup
        au!
		au QuickFixCmdPost vimgrep cw
        au BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
        au BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
        " au BufWritePre * :%s/\s\+$//e
augroup END


"  **************** python 用の自動設定 ****************
function! PythonFoldSetting(lnum)
    " foldlevelは3まで
    set foldnestmax=3

    " 現在の行
    let line = getline(a:lnum)
    let ind  = indent(a:lnum)
    let flev = foldlevel(a:lnum)

    " 次の行
    let line1 = getline(a:lnum + 1)

    " 次の非空行
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

function! PythonFoldText(lnum)
    let line = getline(v:foldstart)
    let nline = getline(v:foldstart + 1)
    let ind = indent(a:lnum)
    let dstind = ''
    for i in range(ind)
        let dstind = dstind.'-- '
    endfor
    let sub = substitute(line, '^(\s\*)', dstind, 'g')
    return v:folddashes . sub.nline
endfunction
augroup myPythonGroup
        au!
        " jedi-vim自動選択をoff にする"
        au BufEnter,BufNewFile,BufRead *.py call g:SetPopOnJediOff()
		" jedi-vim のpop out を解除
		au FileType python setlocal completeopt-=preview
        " class view を設定"
        " au BufNewFile,BufRead *.py :TagbarToggle
        au BufNewFile,BufRead *.py :NeoSnippetSource ~/.vim/mysnip/python.snip
        au BufEnter *.py :IndentLinesEnable
		au FileType python set tabstop=4
		au FileType python set autoindent
		au FileType python set expandtab
		au FileType python set shiftwidth=4
        au FileType python set modeline
        au FileType python set foldmethod=marker
augroup END


"  **************** latex 用の自動設定 ****************
function! g:SetLaTeXMainSource() " latex 用関数
	let currentFileDirectory = expand('%:p:h')
	if has('win32') || has('win64')
    	let latexmain = currentFileDirectory .'\main.tex' 
		call g:SetQuickrunConfig()
		let g:quickrun_config['tex']['srcfile'] = latexmain
	elseif has('unix')
		let latexmain = currentFileDirectory . '/main.tex'
		call g:SetQuickrunConfig()
		let g:quickrun_config['tex']['srcfile'] = latexmain
	endif
endfunction
augroup myLaTeXGroup
        au!
        au BufNewFile,BufRead *.tex :NeoSnippetSource ~/.vim/mysnip/tex.snip
        au BufNewFile,BufRead *.tex filetype plugin indent off
        au BufEnter *.tex nnoremap <Leader>v :call <SID>:TexPdfView()<CR>
        au BufEnter *.tex call g:SetLaTeXMainSource()
		au BufEnter *.tex nnoremap <Leader><Leader>r :QuickRun tex<CR>
		au BufEnter *.tex set commentstring=\%\%s
		au FileType tex set tabstop=4
		au FileType tex set autoindent
		if has("mac")
			au FileType tex inoremap \ \
		endif
augroup END

" C++ 用
augroup myCppGroup
		autocmd!
		autocmd FileType cpp set tabstop=4
		au FileType cpp  set tabstop=4
		au FileType cpp  set autoindent
		au FileType cpp  set expandtab
		au FileType cpp  set shiftwidth=4
		au FileType cpp  set foldmethod=marker
        au FileType cpp inoremap <C-Space> <Plug>(marcing_start_omni_complete)
augroup END

augroup MyMarkdownGroup
	autocmd!
	autocmd BufRead,BufWrite *.md set filetype=markdown
	au BufRead,BufWrite call g:SetQuickrunConfig()
augroup END

augroup myJSGroup
	autocmd!
	autocmd FileType html setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END
" vim:set comentstrings=" %s
" vim:set foldmethod=marker: "
