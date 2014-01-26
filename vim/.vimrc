filetype off

" Vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins
Bundle 'kien/ctrlp.vim'
Bundle 'kchmck/vim-coffee-script'

syntax enable
filetype plugin indent on

let mapleader=","

" I like seeing numbers
set nu

" 256 colors, using DAS's wonderful GRB color scheme
set t_Co=256
color badwolf
set background=dark

" I like tabs. That's another story.
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

" Because that's for cheaters
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Smart line numbers. Relative when in normal mode.
if has("relativenumber")
	set relativenumber
	au BufEnter * :set rnu
	au BufLeave * :set nu
	au WinEnter * :set rnu
	au WinLeave * :set nu
	au InsertEnter * :set nu
	au InsertLeave * :set rnu
	au FocusLost * :set nu
	au FocusGained * :set rnu
endif
