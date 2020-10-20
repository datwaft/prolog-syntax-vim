" Vim ftdetect file
" Language: prolog
" Mantainer: datwaft <github.com/datwaft>

augroup prolog_ftype
  au!
  au BufNewFile,BufRead *.pl set filetype=prolog
augroup END
