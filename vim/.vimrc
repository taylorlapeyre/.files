" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'mustache/vim-mustache-handlebars'
  Plugin 'mattn/emmet-vim'
  Plugin 'rust-lang/rust.vim'
call vundle#end()

" Syntax, Filetype, Colorscheme
syntax enable
filetype plugin indent on

if has('gui_running')
  set background=dark
else
  colorscheme solarized
  set background=dark
endif

" General Settings, Indentation
let mapleader=" "
set expandtab smarttab
set tabstop=2 shiftwidth=2
set autoindent
set breakindent breakindentopt=shift:4,sbr
set number relativenumber
set backspace=indent,eol,start
set showcmd

" Nicer Searching
set showmatch matchtime=2
set incsearch
set ignorecase smartcase

" Nicer Scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Smart tab completion. Credit: Gary Bernhardt
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

" Run a given vim command on the results of fuzzy selecting from
" a given shell command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens
    " otherwise, there will be leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>
nnoremap <leader>h :call SelectaCommand("find * -type f", "", ":split")<cr>
nnoremap <leader>v :call SelectaCommand("find * -type f", "", ":vsplit")<cr>

" To help practice
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Switch between splits
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>
