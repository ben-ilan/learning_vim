" Last updated: 2026-03-03
" Vim uses the home row h,j,k,l for cursor movement
" This leaves room for other uses for the arrow keys

" NORMAL MODE: window management <C-W>
nnoremap <Up> <C-W><Up>
nnoremap <Down><Down> <C-W><Down> 
nnoremap <Left> <C-W><Left>
nnoremap <Right> <C-W><Right>
nnoremap <Down><Del> :bd<CR>
nnoremap <Down><Right> :w<CR>:bn<CR> 
nnoremap <Down><Left> :w<CR>:bp<CR>

" INSERT MODE: Omni completion   
inoremap <expr> <Up> pumvisible() ? "\<C-P>" : "\<nop>"  
inoremap <expr> <Down> pumvisible() ? "\<C-N>" : "\<nop>"
inoremap <Left> <C-X><C-F> 
inoremap <Right> <C-X><C-O>

