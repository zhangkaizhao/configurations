#----------
# General
#----------

export CLICOLOR=true
export EDITOR="vim"

alias ls="ls -F"
alias ll="ls -lh"
alias vi="vim"

# 2023-07-30 open files limit:
# 1) https://docs.riak.com/riak/kv/2.2.3/using/performance/open-files-limit/
# 2) https://apple.stackexchange.com/a/366319
ulimit -n 524288
#ulimit -u 2048

# set unique entries in PATH https://unix.stackexchange.com/a/62599/126066
typeset -U path PATH

_prepend_path() {
  path[1,0]=$1
  export PATH
}

# user bins
_prepend_path "$HOME/bin"

#-----------
# Programs
#-----------

# Zsh itself

# turn off the beep/bell sound from https://blog.vghaisas.com/zsh-beep-sound/
# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
# unsetopt LIST_BEEP

# https://unix.stackexchange.com/questions/167582/why-zsh-ends-a-line-with-a-highlighted-percent-symbol
# (Reference is https://zsh.sourceforge.io/Doc/Release/Options.html#Prompting )
# turn off PROMPT_CR and PROMPT_SP to behave more like traditional shells for partial lines (not end with a newline)
unsetopt prompt_cr prompt_sp
# or put nothing at the end of partial lines
#export PROMPT_EOL_MARK=''

# simple from https://wiki.archlinux.org/index.php/zsh
autoload -Uz compinit promptinit
compinit
promptinit

prompt restore

# no remove postfix slash of command line from https://unix.stackexchange.com/a/315611/126066
#setopt noautoremoveslash
# or from https://unix.stackexchange.com/q/160026/126066
#unsetopt autoremoveslash

# Git Integration from https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
#autoload -Uz vcs_info
#precmd_vcs_info() { vcs_info }
#precmd_functions+=( precmd_vcs_info )
#setopt prompt_subst
#RPROMPT=\$vcs_info_msg_0_
#zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
#zstyle ':vcs_info:*' enable git

# 2024-09-15 https://github.com/zsh-users/zsh-autosuggestions
# Installed by `git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions`
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# 2024-09-15 https://github.com/zsh-users/zsh-syntax-highlighting
# Installed by `git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting`
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# 2024-09-15 https://github.com/zsh-users/zsh-history-substring-search
# Installed by `git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search`
if [ -f ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
  source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
fi

# 2024-10-04 pkgsrc and pkgin
_prepend_path "/opt/pkg/sbin"
_prepend_path "/opt/pkg/bin"

# 2021-12-20 git commit with gpg sign issue https://stackoverflow.com/q/41052538/3449199
# Some explanation: https://samuelsson.dev/sign-git-commits-on-github-with-gpg-in-macos/
export GPG_TTY=$(tty)

# TeX Live install: https://www.tug.org/texlive/quickinstall.html
# TeX Live upgrade: https://tug.org/texlive/upgrade.html
_prepend_path "/opt/programs/texlive/2024/bin/universal-darwin"

# 2024-10-06 fastfetch https://github.com/fastfetch-cli/fastfetch
_prepend_path "/opt/programs/fastfetch/usr/bin"

# 2024-10-06 pandoc https://pandoc.org/
_prepend_path "/opt/programs/pandoc/bin"

# 2024-11-02 lima https://lima-vm.io/
_prepend_path "/opt/programs/lima/bin"

# 2024-09-26 Dart Pub, Flutter and Flutter SDK
# https://mirrors.tuna.tsinghua.edu.cn/help/dart-pub/
# https://mirrors.tuna.tsinghua.edu.cn/help/flutter/
# https://mirrors.tuna.tsinghua.edu.cn/help/flutter-sdk.git/
export PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub"
export FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
export FLUTTER_GIT_URL="https://mirrors.tuna.tsinghua.edu.cn/git/flutter-sdk.git"
_prepend_path "/opt/programs/flutter/bin"

# 2024-10-08 Python
_prepend_path "/opt/programs/python/bin"

# 2024-10-08 Ruby
_prepend_path "/opt/programs/ruby/bin"

# 2024-10-08 Erlang
_prepend_path "/opt/programs/erlang/bin"

# 2024-10-08 Elixir
_prepend_path "/opt/programs/elixir/bin"

# 2024-10-09 Node
_prepend_path "/opt/programs/node/bin"

# 2024-10-30 Chez Scheme
_prepend_path "/opt/programs/chez-scheme/bin"

# Go
_prepend_path "/opt/programs/go/bin"

# Go GOPATH
export GOPATH=$HOME/goext
_prepend_path "$GOPATH/bin"

# 2022-04-02 Goproxy.cn https://goproxy.cn/
export GO111MODULE=on
export GOPROXY=https://goproxy.cn

# Rust rustup https://mirrors.ustc.edu.cn/help/rust-static.html
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

# Rust Cargo
_prepend_path "$HOME/.cargo/bin"

# 2018-12-12 Haskell ghcup
_prepend_path "$HOME/.ghcup/bin"
_prepend_path "$HOME/.cabal/bin"

# 2019-02-09 OCaml opam
test -r $HOME/.opam/opam-init/init.sh && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# 2022-11-13 Doom Emacs https://github.com/doomemacs/doomemacs
# `git clone https://github.com/doomemacs/doomemacs ~/.emacs.d`
# `~/.emacs.d/bin/doom install`
_prepend_path "$HOME/.emacs.d/bin"

#----------
# Other general but must be placed at the bottom
#----------

# show hidden files and directories in zsh completions from https://unix.stackexchange.com/a/308322/126066
# Put this at the bottom because some of the above misc settings will invalidate it.
_comp_options+=(globdots)

# vim: set ts=2 sw=2 et:
