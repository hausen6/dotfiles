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
