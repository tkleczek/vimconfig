"----------------------VUNDLE ---------------------------"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ----------------------------------------------"


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

set number
" Disabling the arrow keys to get better incentive for using normal
" mode to move accross the document

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

inoremap jj <Esc>

set pastetoggle=<F3>
if has("autocmd")
  " When editing a file, always jump to the last cursor position
  au BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \ exe "normal! g`\"" |
  \ endif
endif

" When using autocomplete feature do not search in included files
" source: http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
"set complete-=i

" Automatically reload vim configuration while .vimrc changes
" source http://stackoverflow.com/questions/2400264/is-it-possible-to-apply-vim-configurations-without-restarting/2403926#2403926
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Readline-like filename completion
" source - http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list,full
set wildmenu

" Enable syntax highlighting when buffers were loaded through :bufdo, which
" disables the Syntax autocmd event to speed up processing.
" source - http://stackoverflow.com/questions/10513583/filetype-setting-lost-after-reloading-all-files-in-buffer/
augroup EnableSyntaxHighlighting
    " Filetype processing does happen, so we can detect a buffer initially
    " loaded during :bufdo through a set filetype, but missing b:current_syntax.
    " Also don't do this when the user explicitly turned off syntax highlighting
    " via :syntax off.
    " Note: Must allow nesting of autocmds so that the :syntax enable triggers
    " the ColorScheme event. Otherwise, some highlighting groups may not be
    " restored properly.
    autocmd! BufWinEnter * nested if exists('syntax_on') && ! exists('b:current_syntax') && ! empty(&l:filetype) | syntax enable | endif

    " The above does not handle reloading via :bufdo edit!, because the
    " b:current_syntax variable is not cleared by that. During the :bufdo,
    " 'eventignore' contains "Syntax", so this can be used to detect this
    " situation when the file is re-read into the buffer. Due to the
    " 'eventignore', an immediate :syntax enable is ignored, but by clearing
    " b:current_syntax, the above handler will do this when the reloaded buffer
    " is displayed in a window again.
    autocmd! BufRead * if exists('syntax_on') && exists('b:current_syntax') && ! empty(&l:filetype) && index(split(&eventignore, ','), 'Syntax') != -1 | unlet! b:current_syntax | endif
augroup END

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

nnoremap <Leader>r :!make<CR>

nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>

nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" Ctrl + O to return, Ctrl + I to move forward
nnoremap <leader>yd :YcmCompleter GoTo<CR>
nnoremap <leader>yr :YcmCompleter RefactorRename 
