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

set colorcolumn=120

" PEP 008
autocmd FileType python setlocal colorcolumn=80
" rustfmt default config
autocmd FileType rust setlocal colorcolumn=100

" => cursor position

set cursorline
"set cursorcolumn

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

" => spell
"set spell spelllang=en_us
" https://robots.thoughtbot.com/vim-spell-checking
"autocmd BufRead,BufNewFile *.markdown setlocal spell
"autocmd BufRead,BufNewFile *.md setlocal spell
"autocmd BufRead,BufNewFile *.rst setlocal spell
"autocmd BufRead,BufNewFile *.txt setlocal spell
"autocmd FileType gitcommit setlocal spell

" => packages

" Use minpac to manage packages for Vim 8: https://github.com/k-takata/minpac .
" Windows:
"   cd /d %USERPROFILE%
"   git clone https://github.com/k-takata/minpac.git vimfiles\pack\minpac\opt\minpac
" Linux/macOS:
"   mkdir -p ~/.vim/pack/minpac/opt
"   git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
" Use `call minpac#update()` to install or update packages.
" Use `call minpac#clean()` to uninstall unused packages.
silent! set packpath^=~/.vim
silent! packadd minpac

if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " ALE https://github.com/w0rp/ale
  call minpac#add('w0rp/ale')
  " bufferhint https://github.com/bsdelf/bufferhint.git
  call minpac#add('bsdelf/bufferhint')
  " idris-vim https://github.com/idris-hackers/idris-vim.git
  call minpac#add('idris-hackers/idris-vim')
  " lightline.vim https://github.com/itchyny/lightline.vim
  call minpac#add('itchyny/lightline.vim')
  " NERDTree https://github.com/scrooloose/nerdtree
  call minpac#add('scrooloose/nerdtree')
  " nim.vim https://github.com/zah/nim.vim
  call minpac#add('zah/nim.vim')
  " rust.vim https://github.com/rust-lang/rust.vim.git
  call minpac#add('rust-lang/rust.vim')
  " vim-crystal https://github.com/rhysd/vim-crystal.git
  call minpac#add('rhysd/vim-crystal')
  " vim-elixir https://github.com/elixir-editors/vim-elixir.git
  call minpac#add('elixir-editors/vim-elixir')
  " vim-fish https://github.com/dag/vim-fish.git
  call minpac#add('dag/vim-fish')
  " vim-go https://github.com/fatih/vim-go.git
  call minpac#add('fatih/vim-go')
  " vim-markdown-preview https://github.com/JamshedVesuna/vim-markdown-preview.git
  call minpac#add('JamshedVesuna/vim-markdown-preview')
  " vim-preview https://github.com/greyblake/vim-preview.git
  call minpac#add('greyblake/vim-preview')
  " vim-racer https://github.com/racer-rust/vim-racer.git
  call minpac#add('racer-rust/vim-racer')
  " vim-signify https://github.com/mhinz/vim-signify
  call minpac#add('mhinz/vim-signify')
  " vim-toml https://github.com/cespare/vim-toml.git
  call minpac#add('cespare/vim-toml')
  " vim-vue https://github.com/posva/vim-vue.git
  call minpac#add('posva/vim-vue')

  " -> pack configurations

  " - ALE https://github.com/w0rp/ale

  "let g:ale_linters_explicit = 1
  "let g:ale_completion_delay = 500
  "let g:ale_echo_delay = 20
  "let g:ale_lint_delay = 500
  let g:ale_echo_msg_format = '[%linter%] %code: %%s'
  "let g:ale_lint_on_enter = 1
  "let g:ale_lint_on_text_changed = 'normal'
  let g:ale_lint_on_insert_leave = 1
  "let g:airline#extensions#ale#enabled = 1

  " pylint disabled
  let g:ale_python_pylint_executable = ''

  " - lightline.vim
  set laststatus=2
  set noshowmode
  let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

  " - NERDTree
  map <C-o> :NERDTreeToggle<CR>
  let NERDTreeShowHidden = 1
endif

" => keymap

" Buffer Hint: https://bsdelf.github.io/posts/intro-buffer-hint
nnoremap - :call bufferhint#Popup()<CR>
nnoremap \ :call bufferhint#LoadPrevious()<CR>

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
