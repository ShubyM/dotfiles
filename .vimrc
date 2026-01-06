" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
 Plug 'google/vim-maktaba'
 Plug 'google/vim-codefmt'
 " Plug 'preservim/nerdtree'
 " Plug 'sheerun/vim-polyglot'
 " Plug 'Yggdroot/indentLine'
 " Plug 'joshdick/onedark.vim'
call plug#end()


imap jj <Esc>

set tabstop=2 shiftwidth=2 expandtab
set clipboard=unnamed
set number


" let NERDTreeMinimalUI=1
" set fillchars=vert:\
" set fillchars=eob:\
" if $TERM_PROGRAM == 'iTerm.app'
  " let g:indentLine_char=''
  " let g:indentLine_first_char=''
  " let g:indentLine_showFirstIndentLevel=1
" endif

filetype plugin on
" autocmd FileType apache setlocal commentstring=#\ %s

let g:python_recommended_style = 0
filetype plugin indent on

" colorscheme peachpuff
highlight Comment ctermfg=green

" set termguicolors
" colorscheme onedark
" colorscheme peachpuff
syntax on





