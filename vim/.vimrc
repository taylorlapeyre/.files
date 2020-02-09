
" Automatically load colorschemes, file plugins, file indentation,
" and syntax for the given file.
syntax enable
filetype plugin indent on

" Colors
set t_Co=256
colorscheme solarized
set background=dark

" Use spacebar for leader
let mapleader=" "

" Use 2 spaces instead of \t
set expandtab
set tabstop=2 shiftwidth=2

" Copy indentation from current line when inserting a \n
set autoindent

" Instead of backspace deleting one space at a time, delete by
" levels of indentation
set smarttab

" Indent lines that wrap around the screen by 4 spaces on the next line
set breakindent breakindentopt=shift:4,sbr

" Enable line numbers, relative to the current line
set number relativenumber
set backspace=indent,eol,start

" Show me what commands I'm typing
set showcmd

" Highlight matching brackets
set showmatch

" Highlight matching terms as I seatch, and ignore case unless
" I explicitly have uppercase characters
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
" a given shell command. See usage below. Credit: Gary Bernhardt
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
let fileCommand = 'find * -type f | grep -v "\(node_modules\|coverage\|fixtures\|build\|bin\|vendor\|tmp\|git\|public\)"'
nnoremap <leader>f :call SelectaCommand(fileCommand, "", ":e")<cr>
nnoremap <leader>h :call SelectaCommand(fileCommand, "", ":split")<cr>
nnoremap <leader>v :call SelectaCommand(fileCommand, "", ":vsplit")<cr>

" Switch between splits by just holding ctrl
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>
