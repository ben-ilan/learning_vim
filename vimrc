" Last updated: 2026-03-05
let skip_defaults_vim = 1
runtime! debian.vim
filetype plugin indent on
syntax on

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

let mapleader = ","
set number

" bellof for errors in Normal mode 
set belloff=error

" linebreak and wrap defaults
set nolinebreak
set nowrap

set confirm " shows a dialog before exiting a buffer
set clipboard="" "no connection with the external clipboard, use "+p
set splitbelow

" always perform very magic pattern search
nnoremap / /\v

" prevent starting in Replace mode when accessing from ssl 
if $TERM =~ 'xterm-256color'
   nnoremap <Esc>^[ <Esc>^[
endif

" tabs
set tabstop=3
set shiftwidth=3
set expandtab

" MAPPINGS 
" enter command line mode with ; as well
nnoremap ; :

" leaving Insert,  Visual and Command Mode  easy
inoremap <leader>. <Esc>
vnoremap <leader>. <Esc>
tnoremap <leader>. <C-\><C-n>

" but prevent firing the . operator by accident in normal mode
nnoremap <leader>. <Nop>

" insert spaces and blank lines in normal mode.
nnoremap <leader><Space> i<Space><Esc>l
nnoremap <leader><CR> o<Esc>

" endings
nnoremap <leader>; g_
inoremap <leader>; <Esc>g_

" access clipboard from SELECT Mode
snoremap <C-R> <SPACE><BS><C-R>

" select first to last character of line in visual mode
xnoremap il ^og_h

" leave insert mode after 10 seconds inactivity
augroup insert_leave
   autocmd!
   autocmd CursorHoldI * stopinsert
   autocmd InsertEnter * let updaterestore=&updatetime | set updatetime=10000
   autocmd InsertLeave * let &updatetime=updaterestore
augroup END
