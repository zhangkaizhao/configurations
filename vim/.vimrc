" => general

filetype plugin on
filetype indent on

set autoread
set autoindent

" CVE-2019-12735
" Chinese: https://zhuanlan.zhihu.com/p/68191151
" Original in English: https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
set modelines=0
set nomodeline

" Do not auto add a newline at EOF
" https://stackoverflow.com/questions/1050640/how-to-stop-vim-from-adding-a-newline-at-end-of-file
" Vim 7.4.785 adds the fixeol option that can be disabled to automatically preserve any missing EOL at the end of the file.
set nofixendofline

" => filetype

" Slang: Slim-inspired templating language for Crystal
" https://github.com/jeromegn/slang
" http://slim-lang.com/
autocmd BufNewFile,BufRead *.slang setlocal filetype=slim

autocmd BufNewFile,BufRead *.lqd setlocal filetype=liquid

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
"colorscheme desert

set colorcolumn=120

" PEP 008
autocmd FileType python setlocal colorcolumn=80
" rustfmt default config
autocmd FileType rust setlocal colorcolumn=100

" => cursor position

"set cursorline
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

" disable bells/visualbells https://unix.stackexchange.com/a/5313/126066
" 1. enable vim's internal visual bell
set visualbell
" 2. set the effect of the vim visual bell to do nothing
set t_vb=

" => tab

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

autocmd FileType crystal setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
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

if exists('g:loaded_minpac')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " ALE https://github.com/w0rp/ale
  call minpac#add('w0rp/ale')
  " base16-vim https://github.com/chriskempson/base16-vim
  call minpac#add('chriskempson/base16-vim')
  " bufferhint https://github.com/bsdelf/bufferhint
  call minpac#add('bsdelf/bufferhint')
  " elm-vim https://github.com/ElmCast/elm-vim
  call minpac#add('ElmCast/elm-vim')
  " gleam.vim https://github.com/gleam-lang/gleam.vim
  call minpac#add('gleam-lang/gleam.vim')
  " idris-vim https://github.com/idris-hackers/idris-vim
  call minpac#add('idris-hackers/idris-vim')
  " inko.vim https://gitlab.com/inko-lang/inko.vim
  "call minpac#add('https://gitlab.com/inko-lang/inko.vim')
  " janet.vim https://github.com/janet-lang/janet.vim
  call minpac#add('bakpakin/janet.vim')
  " kotlin-vim https://github.com/udalov/kotlin-vim
  call minpac#add('udalov/kotlin-vim')
  " lightline.vim https://github.com/itchyny/lightline.vim
  call minpac#add('itchyny/lightline.vim')
  " NERDTree https://github.com/scrooloose/nerdtree
  call minpac#add('scrooloose/nerdtree')
  " nim.vim https://github.com/zah/nim.vim
  call minpac#add('zah/nim.vim')
  " Odin.vim https://github.com/Tetralux/odin.vim
  call minpac#add('Tetralux/odin.vim')
  " rust.vim https://github.com/rust-lang/rust.vim
  call minpac#add('rust-lang/rust.vim')
  " swift.vim https://github.com/keith/swift.vim
  call minpac#add('keith/swift.vim')
  " Tagbar https://github.com/preservim/tagbar
  call minpac#add('preservim/tagbar')
  " typescript-vim https://github.com/leafgarland/typescript-vim
  call minpac#add('leafgarland/typescript-vim')
  " vala.vim https://github.com/arrufat/vala.vim
  call minpac#add('arrufat/vala.vim')
  " vim-crystal https://github.com/vim-crystal/vim-crystal
  call minpac#add('vim-crystal/vim-crystal')
  " vim-elixir https://github.com/elixir-editors/vim-elixir
  call minpac#add('elixir-editors/vim-elixir')
  " vim-fish https://github.com/dag/vim-fish
  call minpac#add('dag/vim-fish')
  " vim-go https://github.com/fatih/vim-go
  call minpac#add('fatih/vim-go')
  " vim-graphql https://github.com/jparise/vim-graphql
  call minpac#add('jparise/vim-graphql')
  " vim-markdown-preview https://github.com/JamshedVesuna/vim-markdown-preview
  call minpac#add('JamshedVesuna/vim-markdown-preview')
  " vim-nix https://github.com/LnL7/vim-nix
  call minpac#add('LnL7/vim-nix')
  " vim-pony https://github.com/jakwings/vim-pony
  call minpac#add('jakwings/vim-pony')
  " vim-preview https://github.com/greyblake/vim-preview
  call minpac#add('greyblake/vim-preview')
  " vim-racer https://github.com/racer-rust/vim-racer
  " Active development on Racer and vim-racer has stopped.
  "call minpac#add('racer-rust/vim-racer')
  " vim-radon https://github.com/rubik/vim-radon
  call minpac#add('rubik/vim-radon')
  " vim-rails https://github.com/tpope/vim-rails
  call minpac#add('tpope/vim-rails')
  " vim-signify https://github.com/mhinz/vim-signify
  call minpac#add('mhinz/vim-signify')
  " vim-slim https://github.com/slim-template/vim-slim
  call minpac#add('slim-template/vim-slim')
  " vim-toml https://github.com/cespare/vim-toml
  call minpac#add('cespare/vim-toml')
  " vim-vue https://github.com/posva/vim-vue
  call minpac#add('posva/vim-vue')
  " zig.vim https://github.com/ziglang/zig.vim
  call minpac#add('ziglang/zig.vim')

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

  " ccls options https://github.com/MaskRay/ccls/wiki/Customization#initialization-options
  let g:ale_c_ccls_init_options = { 'cache': { 'directory': '/tmp/ccls-cache', }, }

  " pylint disabled
  let g:ale_python_pylint_executable = ''
  " mypy disabled
  let g:ale_python_mypy_executable = ''

  " Only enable rustc for Rust to avoid building crates which results in huge size target directories.
  let g:ale_linters = {'rust': ['rustc']}

  " - base16-vim https://github.com/chriskempson/base16-vim
  "colorscheme base16-materia


  " - Buffer Hint: https://bsdelf.github.io/posts/intro-buffer-hint
  nnoremap - :call bufferhint#Popup()<CR>
  nnoremap \ :call bufferhint#LoadPrevious()<CR>

  " - lightline.vim
  set laststatus=2
  set noshowmode
  let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

  " - NERDTree
  map <C-o> :NERDTreeToggle<CR>
  let NERDTreeShowHidden = 1

  " - Tagbar
  nmap <F8> :TagbarToggle<CR>

  " - zig.vim
  let g:zig_fmt_autosave = 0
endif

" => keymap

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
