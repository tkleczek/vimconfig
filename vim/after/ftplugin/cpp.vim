" Use the below highlight group when displaying bad whitespace is desired

highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in mode as bad.
call matchadd("BadWhitespace", '^\t', -1)
" Make trailing whitespace be flagged as bad.
call matchadd("BadWhitespace", '\s\+$', -1)

set ts=2 sts=2 sw=2

set expandtab
