" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set backspace=indent,eol,start " backspace through everything in insert mode

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

set encoding=utf-8
set showcmd	" display incomplete commands

set nowrap	" don't wrap lines
set ts=2 	" Number of spaces that a <Tab> in the file counts for
set sts=2 	" It should be set to the same value as ts (don't know how it works otherwise)
set sw=2 	" Number of spaces to use for each step of indent
set expandtab
set autoindent

set nobackup
set nowritebackup

set nohlsearch
set incsearch 		" incremental searching
set ignorecase 		" searches are case insensitive
set smartcase		" ... unless they contain at least one capital letter
