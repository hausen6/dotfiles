" === 一般的な設定  ===
" 変数宣言
if has('nvim')
    let $MYVIMRC = "~/.config/nvim/init.vim"
else
    let $MYVIMRC = "~/.vimrc"
endif

set swapfile
set directory=$HOME/.vim/swapfiles

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
