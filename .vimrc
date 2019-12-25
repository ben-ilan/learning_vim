" *** GENERAL SETTINGS ***
" ---------------------{{{

filetype plugin indent on

let mapleader = ","

set number
set nolinebreak
set confirm " shows a dialog before exiting a buffer

" TABS --------{{{
set tabstop=3
set shiftwidth=3
set expandtab
"}}}

" MODE SWITCHING {{{

" enter command line mode with ; as well
nnoremap ; :

" leaving Insert and Visual mode more easy
inoremap <leader>. <Esc>
vnoremap <leader>. <Esc>
" but prevent firing the . operator by accident 
nnoremap <leader>. <Nop>

" leave insert mode after 10 seconds inactivity
" TODO mention reference
augroup general
   autocmd!
   autocmd CursorHoldI * stopinsert
   autocmd InsertEnter * let updaterestore=&updatetime | set updatetime=10000
   autocmd InsertLeave * let &updatetime=updaterestore
augroup END

" }}}

" FOLDING FILETYPE VIM SPECIFIC ---------{{{
augroup filetype_vim
   autocmd!
   autocmd FileType vim setlocal foldmethod=marker
   autocmd FileType vim setlocal foldlevelstart=1
augroup END
"}}}
"}}}

" *** MAPPINGS *** 
" -------------{{{ 

" FUNCTION KEYS {{{ 

" <F1>: invokes VIM's help system (DO NOT OVERRIDE)
noremap <F1> :help<CR>

" <F2>: reloads the default .vimrc configuration (DO NOT OVERRIDE)
noremap <F2> :source ~/.vimrc<CR>:echom ".vimrc reloaded"<CR>

" <F3>: switches between language specific configurations (DO NOT OVERRIDE) 
nnoremap <F3> :source ~/.vim/

" <F4>: switch configuration to current filetype (DO NOT OVERRIDE)
" TODO maybe this one is not needed if filetype specific loadings take place
" in .vimrc and thus invoked through <F2>. 

" <F5>: run in console or browser 
noremap <F5> :w<CR>:source %<CR>

" <F6>: open terminal buffer inside Vim
nnoremap <F6> :term <CR>

" <F7>: TMP 

" <F8>: GIT (DO NOT OVERRIDE)
"
" <F9>: GIT (DO NOT OVERRIDE)


" }}}

" <leader>[0-9] TOGGLE OPTIONS ---------{{{

" 1: toggle project tree
nnoremap <leader>1 :Lexplore<CR>

" 2: toggle QuickFix window
nnoremap <leader>2 :call QuickfixToggle()<CR>

let g:quickfix_is_open = 0

" TODO: remove to functions section
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

" 7: toggle foldcolumn
nnoremap <leader>7 :call FoldColumnToggle()<CR>
" TODO: remove to functions section
function! FoldColumnToggle()
   if &foldcolumn
      setlocal foldcolumn=0
   else
      setlocal foldcolumn=4
   endif
   set foldcolumn?
endfunction
"}}}

" OTHER {{{
" insert spaces and blank lines in normal mode.
nnoremap <leader><Space> i<Space><Esc>l
nnoremap <leader><CR> o<Esc>
"}}}
"
"}}}

" *** TEMP SETTINGS ***
" ------------------{{{ 
" LEARNING ---------{{{
nnoremap <Up> :!echo "Do not use the arrow keys anymore, OK?\!"<CR>
nnoremap <Down> :!echo "Do not use the arrow keys anymore, OK?\!"<CR>
nnoremap <Left> :!echo "Do not use the arrow keys anymore, OK?\!"<CR>
nnoremap <Right> :!echo "Do not use the arrow keys anymore, OK?\!"<CR>

inoremap <Up> <Esc>:!echo "Do not use the arrow keys anymore, OK?\!"<CR>
inoremap <Down> <Esc>:!echo "Do not use the arrow keys anymore, OK?\!"<CR>
inoremap <Left> <Esc>:!echo "Do not use the arrow keys anymore, OK?\!"<CR>
inoremap <Right> <Esc>:!echo "Do not use the arrow keys anymore, OK?\!"<CR>

vnoremap <Up> <Esc>:!echo "Do not use the arrow keys anymore, OK?\!"<CR>
vnoremap <Down> <Esc>:!echo "Do not use the arrow keys anymore, OK?\!"<CR>
vnoremap <Left> <Esc>:!echo "Do not use the arrow keys anymore, OK?\!"<CR>
vnoremap <Right> <Esc>:!echo "Do not use the arrow keys anymore, OK?\!"<CR>
"}}}

" EXPERIMENTATION ---------{{{

" always perform very magic pattern search
nnoremap / /\v

" Statusline experimentation
" Add visual cue to Insert mode.
" TODO Wrap this in a function
set laststatus=2
set statusline=%#LineNr#---\ %#StatusLineNC#%f\ \ \ \ %=Line:%4l\\%-4L
augroup my_statusline
   autocmd!
   autocmd InsertEnter * set statusline=%#LineNr#---\ %#WildMenu#---INSERT\ MODE---\ \ %f\ \ ---INSERT\ MODE---
   autocmd InsertLeave * set statusline=%#LineNr#---\ %#StatusLineNC#%f\ \ \ \ %=Line:%4l\\%-4L
augroup END

" my configuration for ntrw file browser see (https://shapeshed.com/vim-netrw/) 
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" quotes and brackets
nnoremap <leader>" i""<Esc>i
nnoremap <leader>' i''<Esc>i
nnoremap <leader>{ i{}<Esc>i
nnoremap <leader>[ i[]<Esc>i
nnoremap <leader>` i``<Esc>i
nnoremap <leader>( i()<Esc>i

"TODO: inoremap or abbreviations
"      vnoremap

"}}}

"}}}
