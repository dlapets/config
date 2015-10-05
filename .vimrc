set nocompatible

syntax on
set number
set relativenumber
set enc=utf-8
 
set hlsearch
set incsearch
set smartcase

set backspace=2 " make backspace work like most other apps
set ts=4
set sw=4

set expandtab
set smarttab
set smartindent

set scrolloff=4 " show 4 lines around where you are

set undolevels=100

set hidden
set nobackup
set directory=~/.vim/directory

exec pathogen#infect()

nmap <F7> :Gblame<CR>
nmap <F8> :TagbarToggle<CR>
map <F9> :NERDTreeToggle<CR>

augroup filetype
    "js templates
    autocmd BufNewFile,BufRead *.jstpl set filetype=html

    "wk migrations
    autocmd BufNewFile,BufRead *.mig set filetype=mysql
augroup END

if has("gui_running")
	colorscheme desert
	set guifont=terminus
	set go-=T
    "use windows clipper:
    "set clipboard=unnamed
    "set guifontwide=MingLiU:h10 "For windows to display mixed character sets
else
	colorscheme elflord
endif
