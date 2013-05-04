call pathogen#runtime_append_all_bundles()
set runtimepath^=~/.vim/bundle/ctrl-p.vim

:set nu

:set t_Co=256
:color grb256
:set background=dark

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

set showmatch
set incsearch
set hlsearch
set ignorecase smartcase

" set cursorline

set shell=bash

set backspace=indent,eol,start

set showcmd

syntax on

filetype plugin indent on

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>


set scrolloff=8
set sidescrolloff=15
set sidescroll=1


set rnu
au BufEnter * :set rnu
au BufLeave * :set nu
au WinEnter * :set rnu
au WinLeave * :set nu
au InsertEnter * :set nu
au InsertLeave * :set rnu
au FocusLost * :set nu
au FocusGained * :set rnu

let mapleader=","
