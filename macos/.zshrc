#----------
# General
#----------

export CLICOLOR=true
export EDITOR="vim"

# user bins
export PATH="$HOME/bin:$PATH"

alias ls="ls -F"
alias ll="ls -lh"
alias vi="vim"

# 2023-07-30 open files limit:
# 1) https://docs.riak.com/riak/kv/2.2.3/using/performance/open-files-limit/
# 2) https://apple.stackexchange.com/a/366319
ulimit -n 524288
#ulimit -u 2048

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

# Homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_UPGRADE=1
export HOMEBREW_NO_GITHUB_API=1

# https://mirrors.ustc.edu.cn/help/brew.git.html
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"

# 2023-09-12 brew 4.0+:
# 1: https://brew.sh/2023/02/16/homebrew-4.0.0/
# 2: https://mirrors.ustc.edu.cn/help/homebrew-bottles.html
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"

# 2021-06-18 Homebrew uses `/usr/local/sbin` now.
export PATH="/usr/local/sbin:$PATH"

# 2023-08-11 MariaDB: brew info mariadb@10.11
export PATH="/usr/local/opt/mariadb@10.11/bin:$PATH"

# 2024-01-05 PostgreSQL: brew info postgresql@16
export PATH="/usr/local/opt/postgresql@16/bin:$PATH"

# 2021-12-20 git commit with gpg sign issue https://stackoverflow.com/q/41052538/3449199
# Some explanation: https://samuelsson.dev/sign-git-commits-on-github-with-gpg-in-macos/
export GPG_TTY=$(tty)

# TeX Live install: https://www.tug.org/texlive/quickinstall.html
# TeX Live upgrade: https://tug.org/texlive/upgrade.html
export PATH="/usr/local/texlive/2024/bin/universal-darwin:$PATH"

# 2022-11-13 Doom Emacs https://github.com/doomemacs/doomemacs
# `git clone https://github.com/doomemacs/doomemacs ~/.emacs.d`
# `~/.emacs.d/bin/doom install`
export PATH="$HOME/.emacs.d/bin:$PATH"

# 2021-12-14 rbenv https://github.com/rbenv/rbenv
if [ -f $HOME/.rbenv/bin/rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - zsh)"
fi

# 2021-12-14 pyenv https://github.com/pyenv/pyenv
if [ -f $HOME/.pyenv/bin/pyenv ]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init - zsh)"
fi

# 2023-04-29 rye https://github.com/mitsuhiko/rye
#export RYE_HOME="$HOME/.rye"
#if [ -d $RYE_HOME/shims ]; then
#  export PATH="$RYE_HOME/shims:$PATH"
#fi

# Go
export GOPATH=$HOME/goext
export PATH=$GOPATH/bin:$PATH

# 2022-04-02 Goproxy.cn https://goproxy.cn/
export GO111MODULE=on
export GOPROXY=https://goproxy.cn

# Rust Rustup
export PATH=$HOME/.cargo/bin:$PATH

# Use ustc mirror: https://mirrors.ustc.edu.cn/help/rust-static.html
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

# 2018-12-12 Haskell ghcup
export PATH=$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH

# 2019-02-09 OCaml opam
test -r $HOME/.opam/opam-init/init.sh && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# 2023-07-28 asdf https://asdf-vm.com/guide/getting-started.html
#if [ -f $HOME/.asdf/asdf.sh ]; then
#  source "$HOME/.asdf/asdf.sh"
#fi

# 2024-05-12 vfox https://vfox.lhan.me/guides/quick-start.html
if [ $(command -v vfox) ]; then
  eval "$(vfox activate zsh)"
fi

# 2024-01-26 Flutter https://mirrors.tuna.tsinghua.edu.cn/help/flutter/
export PUB_HOSTED_URL=https://mirrors.tuna.tsinghua.edu.cn/dart-pub
export FLUTTER_STORAGE_BASE_URL=https://mirrors.tuna.tsinghua.edu.cn/flutter
export PATH=/usr/local/programs/flutter/bin:$PATH

#----------
# Other general but must be placed at the bottom
#----------

# show hidden files and directories in zsh completions from https://unix.stackexchange.com/a/308322/126066
# Put this at the bottom because some of the above misc settings will invalidate it.
_comp_options+=(globdots)

# vim: set ts=2 sw=2 et:
