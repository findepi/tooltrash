
setlocal textwidth=0

map <buffer> <C-D> :s@^\([[:space:]]*\)\(.*\)$@\1<!-- \2 -->@g<CR>:nohls<CR>
map <buffer> <C-U> :s@^\([[:space:]]*\)<!-- \?\(.\{-}\) \?-->$@\1\2@g<CR>:nohls<CR>

