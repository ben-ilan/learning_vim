noremap <buffer> <silent> <Down><Right> <nop>
nnoremap <buffer> <silent> <Down><Left> <nop>
nnoremap <buffer><silent> <CR> :<C-u>call <SID>NetrwOpenRight()<CR>

function! s:NetrwOpenRight() abort
  " Only the drawer is open? Create a right-hand pane.
  if winnr('$') == 1
    " Make a right vsplit with a reasonable width; adjust '30' to taste.
    execute 'vertical 30split'
    " Return focus to the drawer so the next step (netrw open) uses 'previous' correctly.
    wincmd h
  endif

  " Now delegate to netrw’s own <CR> action (your g:netrw_browse_split=4 will
  " direct the file into the right-hand pane).
  call feedkeys("\<Plug>NetrwLocalBrowseCheck", 'm')
endfunction
