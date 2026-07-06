" FUNCTION KEYS
" <F1>: invokes VIM's help system (DO NOT OVERRIDE)
nnoremap <F1> :help<CR>

" <F2>: Insert date time in buffer
nnoremap <F2> i<C-r>=strftime("%Y-%m-%d")<CR><ESC>
inoremap <F2> <C-r>=strftime("%Y-%m-%d")<CR>

" <F3>: open terminal buffer inside Vim
nnoremap <F3> :term++rows=10<CR>

" <F4>: running scripts 
nnoremap <F4> :echo "This filetype cannot run as a script"<CR>

" <F5>-<F7>: Git  
nnoremap <F5> :!git add %<CR>
nnoremap <F6> :!git commit<CR>
nnoremap <F7> :!git push origin main<CR

" <leader>[0-9] TOGGLE OPTIONS 
" 1: toggle project tree
nnoremap <leader>1 :20Lexplore<CR>

" 2: toggle QuickFix window
nnoremap <leader>2 :call QuickfixToggle()<CR>

let g:quickfix_is_open = 0

function QuickfixToggle()
   if g:quickfix_is_open
      cclose
      let g:quickfix_is_open = 0
      execute g:quickfix_return_to_window . "wincmd w"
   else
      let g:quickfix_return_to_window = winnr()
      copen
      let g:quickfix_is_open = 1
   endif
endfunction

" 3: toggle spellcheck
nnoremap <leader>3 :setlocal spell!<CR>:set spell?<CR>

" 4: toggle relativenumber
nnoremap <leader>4 :setlocal relativenumber!<CR>:set relativenumber?<CR>

" 5: toggle cursorline
nnoremap <leader>5 :setlocal cursorline!<CR>:set cursorline?<CR>

" 6: toggle linebreak
nnoremap <leader>6 :setlocal linebreak!<CR>:set linebreak?<CR>

" 7: toggle colorcolumn
nnoremap <leader>7 :if &l:colorcolumn ==# '80,120' \| setlocal colorcolumn= \| else \| setlocal colorcolumn=80,120 \| endif<CR>
