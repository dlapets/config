set nocompatible
filetype off " vundle needs this

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'SirVer/ultisnips.git'
Plugin 'fatih/vim-go.git'
Plugin 'fholgado/minibufexpl.vim.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'majutsushi/tagbar.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'tobyS/vmustache.git'
Plugin 'tpope/vim-fugitive.git'

call vundle#end()            " required
filetype plugin indent on    " required

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


nmap <F7> :Gblame<CR>
nmap <F8> :TagbarToggle<CR>
map <F9> :NERDTreeToggle<CR>

augroup filetype
    "js templates
    autocmd BufNewFile,BufRead *.jstpl set filetype=html

    "wk migrations
    autocmd BufNewFile,BufRead *.mig set filetype=mysql

    " raml
    autocmd BufNewFile,BufRead *.raml set filetype=yaml

augroup END

augroup indent
    autocmd FileType json setlocal ts=2 sw=2
    autocmd FileType yaml setlocal ts=2 sw=2
augroup END

if has("gui_running")
	colorscheme desert
	set guifont=terminus
	set go-=T
    "use windows clipper:
    "set clipboard=unnamed
    "set guifontwide=MingLiU:h10 "For windows to display mixed character sets
else
	colorscheme desert
endif
