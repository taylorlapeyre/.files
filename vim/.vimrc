filetype off

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-rails'
call vundle#end()

syntax enable
filetype plugin indent on

let g:vim_markdown_folding_disabled=1
let mapleader=","
inoremap jk <ESC>
inoremap kj <ESC>

" I like seeing numbers
set nu
set rnu

" 256 colors, using DAS's wonderful GRB color scheme
set t_Co=256
if has('gui_running')
  colorscheme solarized
  set background=dark
else
  colorscheme grb256
  set background=dark
endif

" Spaces, not tabs.
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent

" Easier, prettier searching
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase
set backspace=indent,eol,start

" Better scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" To see what I'm typing
set showcmd

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

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>

" Because that's for cheaters
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
