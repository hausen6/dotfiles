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

" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" colorscheme
" if dein#tap('vim-hybrid')
"     set background=dark
"     colorscheme hybrid
" endif
"
if dein#tap("vim-tomorrow-theme")
  set background=dark
  colorscheme Tomorrow-Night
endif

" lightline.vim
if dein#tap("lightline.vim")
  set laststatus=2
  set t_Co=256
  let g:lightline = {
    \ 'colorscheme': 'default'
    \ }
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
