set laststatus=2

" statusLine
function g:VIMRC_set_statusline(mode)
   if a:mode ==# "abc" || (has_key(b:,"ABC_obj") && b:ABC_obj.idle == 0) 
      setlocal statusline=%#LineNr#---\ %#PMenu#---SNIPPET\ MODE---\ \ %f\ \ ---SNIPPET\ MODE---
   elseif a:mode ==# "i" 
      setlocal statusline=%#LineNr#---\ %#WildMenu#---INSERT\ MODE---\ \ %f\ \ ---INSERT\ MODE---
   elseif a:mode ==# "n"  
      setlocal statusline=%#LineNr#---\ %#StatusLineNC#%f\ \ \ \ %=Line:%4l\\%-4L
   endif 
endfunction

call VIMRC_set_statusline("n")
augroup my_statusline
   autocmd!
   autocmd InsertEnter * call VIMRC_set_statusline("i")
   autocmd InsertLeave * call VIMRC_set_statusline("n")
augroup END
