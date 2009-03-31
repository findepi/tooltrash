
setlocal shiftwidth=4 softtabstop=4 expandtab

map <buffer> <C-D> :s@^[[:space:]]*@&#@g<CR>:nohls<CR>
map <buffer> <C-U> :s@^\([[:space:]]*\)#@\1@g<CR>:nohls<CR>
