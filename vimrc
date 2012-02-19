" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

set ts=2 " Number of spaces that a <Tab> in the file counts for
set sts=2 " It should be set to the same value as ts (don't know how it works otherwise)
set sw=2 " Number of spaces to use for each step of indent
set expandtab
set autoindent

set nobackup
set nowritebackup

set nohlsearch
set number
