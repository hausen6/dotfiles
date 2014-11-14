":colorscheme hybrid
set background=dark
"colorscheme hybrid
colorscheme solarized

" 環境依存の設定
if has('win32')
  " windows の設定
  au GUIEnter * simalt ~x
    " font の設定
    " フォント名に日本語名を使うので、一時的に文字コードを変える
    " Osaka fontを使う．使用にはインストール -> フォントフォルダに入れる と いった操作が必要
    set encoding=cp932
    " set guifont=Osaka−等幅:h11
    set guifont=Inconsolata:h12:cSHIFTJIS
    set ambiwidth=double
    " set guifont=HGゴシックM:h11:cSHIFTJIS
  " window を半透明にする
  gui
  set transparency=255
else
  set transparency=10
  au GUIEnter * set lines=60
  au GUIEnter * set columns=190
  nnoremap <Leader>w :set transparency=15<CR>
endif
" GUI をFullScreenにする
if has("gui_running")
  if has("mac_kaoriya")
      set fuoptions=maxvert,maxhorz
      au GUIEnter * set fullscreen
  endif
endif

" カーソル行ハイライト
set cursorline
"" カレントウインドウのみをハイライト
"augroup cch
"autocmd! cch
"autocmd WinLeave * set nocursorline
"autocmd WinEnter, BufRead * set cursorline
"augroup END
"hi clear CursorLine
"hi CursorLine gui=underline
"" ESC ESC でハイライトキャンセル
nnoremap <Esc><Esc> :<C-u>set nohlsearch<CR>

source $MYVIMRC
