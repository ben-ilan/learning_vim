" Last updated: 2026-03-03
" Netrw specific configuration
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 50 

augroup NetrwStart
  autocmd!
  autocmd VimEnter * if argc() == 1 && isdirectory(argv(0)) && empty(v:this_session) |
        \ execute 'silent Lexplore 20 ' . fnameescape(argv(0)) |   
        \ wincmd l |
        \ enew |
        \ endif
augroup END


