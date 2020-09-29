" *** GENERAL SETTINGS ***
" Last update: 29-09-2020

" ---------------------{{{
execute pathogen#infect()

filetype plugin indent on

let mapleader = ","

set number

" bellof for errors in Normal mode 
set belloff=error

" linebreak and wrap defaults
set nolinebreak
set nowrap

" but make an exception for md
augroup general_options
   autocmd!
   autocmd FileType markdown,abc  setlocal linebreak
   autocmd FileType markdown,abc  setlocal wrap
augroup END

set confirm " shows a dialog before exiting a buffer

set clipboard="" "no connection with the external clipboard, use "+p

" always perform very magic pattern search
nnoremap / /\v

" NTRW file browser --------{{{
" see (https://shapeshed.com/vim-netrw/) 
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" }}}

" ARROW KEYS --------{{{
nnoremap <Up> <C-W><Up>
nnoremap <Down><Down> <C-W><Down> 
nnoremap <Left> <C-W><Left>
nnoremap <Right> <C-W><Right>

" changing and deleting buffers
" NOTE: changing buffer with the ARROW keys will save automatically
nnoremap <Down><Del> :bd<CR>
nnoremap <Down><Right> :w<CR>:bn<CR> 
nnoremap <C-Tab> :w<CR>:bn<CR> 
nnoremap <Down><Left> :w<CR>:bp<CR>
" }}}

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
" but prevent firing the . operator by accident in normal mode

nnoremap <leader>. <Nop>

" leave insert mode after 10 seconds inactivity
" TODO mention reference
augroup insert_leave
   autocmd!
   autocmd CursorHoldI * stopinsert
   autocmd InsertEnter * let updaterestore=&updatetime | set updatetime=10000
   autocmd InsertLeave * let &updatetime=updaterestore
augroup END

" }}}

"FOLDING FILETYPE VIM ---------{{{
augroup folding
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
nnoremap <F1> :help<CR>

" <F2>: reloads the default .vimrc configuration (DO NOT OVERRIDE)
nnoremap <F2> :w<CR>:source ~/.vimrc<CR>:echom ".vimrc reloaded"<CR>

" <F3>: open terminal buffer inside Vim
nnoremap <F3> :term <CR>

" <F5> + <F6>: run in browser or terminal, <F6> is alternative if there are
" two options for a certain filetype
augroup sourcing
   autocmd!
   autocmd FileType vim nnoremap <buffer> <F5> :w<CR>:source %<CR>
   autocmd FileType vim inoremap <buffer> <F5> <ESC>:w<CR>:source %<CR>l

   autocmd FileType markdown,svg,html nnoremap <silent> <buffer> <F5> :w<CR>:! start chrome %<CR>
   autocmd FileType markdown,svg,html inoremap <silent> <buffer> <F5> <ESC>:w<CR>:! start chrome %<CR>l

   autocmd FileType javascript nnoremap <silent> <buffer> <F5> :w<CR>:echo system("node " . expand("%:p"))<CR>
   autocmd FileType javascript inoremap <silent> <buffer> <F5> <ESC>:w<CR>:echo system("node " . expand("%:p"))<CR>l
   " browser alternative, needs an index.html in the same folder that
   " references the javascript file  
   autocmd FileType javascript nnoremap <silent> <buffer> <F6> :w<CR>:! start chrome "%:h/index.html"<CR>
   autocmd FileType javascript inoremap <silent> <buffer> <F6> <ESC>:w<CR>:! start chrome "%:h/index.html"<CR>l

   autocmd Filetype python nnoremap <silent> <buffer> <F5> :w<CR>:! python3 %<CR>
   autocmd Filetype python inoremap <silent> <buffer> <F5> <Esc>:w<CR>:! python3 %<CR>
augroup END

" <F7>: GIT .add 
nnoremap <F7> :! git add %

" <F9>: Git .commit 
nnoremap <F8> :! git commit

" }}}

" <leader>[0-9] TOGGL OPTIONS ---------{{{

" 1: toggle project tree
nnoremap <leader>1 :20Lexplore<CR>

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

" end
nnoremap <leader>; g_
inoremap <leader>; <Esc>g_

" end a line with a semicolon in javascript 
augroup end_line
   autocmd!
   autocmd FileType javascript nnoremap <buffer> <leader>; g_a;<ESC>
   autocmd FileType javascript inoremap <buffer> <leader>; <ESC>g_a;<ESC>
augroup end

" access clipboard from SELECT Mode
snoremap <C-R> <SPACE><BS><C-R>
"}}}

" select first to last character of line in visual mode
xnoremap il ^og_h 
"}}}

" *** TEMP SETTINGS ***
" ------------------{{{ 
" UNLEARN ARROW KEYS ---------{{{

inoremap <Up> <C-X><C-O>
inoremap <Down> <Esc>:!echo "Do not use the arrow keys anymore, OK?\!"<CR>
inoremap <Left> <Esc>:!echo "Do not use the arrow keys anymore, OK?\!"<CR> 
inoremap <Right> <C-N>

vnoremap <Up> <Esc>:!echo "Do not use the arrow keys anymore, OK?\!"<CR>
vnoremap <Down> <Esc>:!echo "Do not use the arrow keys anymore, OK?\!"<CR>
vnoremap <Left> <Esc>:!echo "Do not use the arrow keys anymore, OK?\!"<CR>
vnoremap <Right> <Esc>:!echo "Do not use the arrow keys anymore, OK?\!"<CR>
"}}}

" EXPERIMENTATION ---------{{{
"
cnoremap <leader>. <CR>

" StatusLine
function g:VIMRC_set_statusline(mode)
   if a:mode ==# "abc" || (has_key(b:,"ABC_obj") && b:ABC_obj.idle == 0) 
      setlocal statusline=%#LineNr#---\ %#PMenu#---SNIPPET\ MODE---\ \ %f\ \ ---SNIPPET\ MODE---
   elseif a:mode ==# "i" 
      setlocal statusline=%#LineNr#---\ %#WildMenu#---INSERT\ MODE---\ \ %f\ \ ---INSERT\ MODE---
   elseif a:mode ==# "n"  
      setlocal statusline=%#LineNr#---\ %#StatusLineNC#%f\ \ \ \ %=Line:%4l\\%-4L
   endif 
endfunction

set laststatus=2

call VIMRC_set_statusline("n")
augroup my_statusline
   autocmd!
   autocmd InsertEnter * call VIMRC_set_statusline("i")
   autocmd InsertLeave * call VIMRC_set_statusline("n")
augroup END

" j and k in markdown files
augroup moving_in_markdown
   autocmd!
   autocmd FileType markdown nnoremap <buffer> j gj
   autocmd FileType markdown nnoremap <buffer> k gk
augroup END
"}}}

"}}}

let s:path_to_snippets_folder = "~/.vim/bundle/snippets_ABC/snippets/"

augroup abc_load
   autocmd!
   autocmd FileType vim call ABC_load(s:path_to_snippets_folder . "vimscript.abc.md")
   autocmd FileType markdown call ABC_load(s:path_to_snippets_folder . "markdown.abc.md")
   autocmd FileType abc call ABC_load(s:path_to_snippets_folder . "markdown.abc.md")
   autocmd FileType abc call ABC_load(s:path_to_snippets_folder . "abc.abc.md")
   autocmd FileType javascript call ABC_load(s:path_to_snippets_folder . "javascript.abc.md")
   autocmd FileType svg call ABC_load(s:path_to_snippets_folder . "svg.abc.md")
   autocmd FileType html call ABC_load(s:path_to_snippets_folder . "html.abc.md")
augroup END

