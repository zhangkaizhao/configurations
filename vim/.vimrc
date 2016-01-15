"execute pathogen#infect()

" => general

filetype plugin on
filetype indent on

set autoread
set autoindent

" => encoding

set encoding=utf-8
set ffs=unix,dos,mac
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" => backup

set nobackup
set nowb
set noswapfile

" => color

syntax on
colorscheme desert
set colorcolumn=80

" => comments

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" => search

set hlsearch
set incsearch
set noignorecase

" => sounds

set noerrorbells
set novisualbell

" => tab

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

" => others

" highlight all redundant white spaces and tabs
" http://stackoverflow.com/a/7342997
highlight RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\+$\|\t/

" http://www.codingpy.com/article/vim-and-python-match-in-heaven/
"autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match RedundantWhitespace /\s\+$/

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
