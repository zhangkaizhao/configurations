#----------
# General
#----------

export EDITOR="vim"

# user bins
export PATH="$HOME/bin:$PATH"

alias ls='ls -F'
alias l='ls -l'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -alh'
alias vi='vim'

# 2023-07-30 open files limit:
# 0) https://gist.github.com/tombigel/d503800a282fcadbee14b537735d202c
# 1) https://docs.riak.com/riak/kv/2.2.3/using/performance/open-files-limit/
# 2) https://apple.stackexchange.com/a/366319
ulimit -n 524288
#ulimit -u 2048

#-----------
# Programs
#-----------

# Bash itself

# Turn off the beep https://unix.stackexchange.com/a/593495/126066
bind 'set bell-style none'

# https://github.com/scop/bash-completion
# The last release for Bash 3.2 is 1.3 (latest version of Bash on macOS).
# https://github.com/scop/bash-completion/archive/1.3.zip
# Download it and unzip to $HOME/.bash-completion first.
if [ -f $HOME/.bash-completion/bash_completion ]; then
  export BASH_COMPLETION=$HOME/.bash-completion/bash_completion
  export BASH_COMPLETION_DIR=$HOME/.bash-completion/completions
  export BASH_COMPLETION_COMPAT_DIR=$HOME/.bash-completion/completions
  source $HOME/.bash-completion/bash_completion
  # bash completion support for core Git
  source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
  # bash completion support for Homebrew
  if [ -f /usr/local/Homebrew/completions/bash/brew ]; then
    source /usr/local/Homebrew/completions/bash/brew
  fi
fi

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

# 2024-01-26 Flutter https://mirrors.tuna.tsinghua.edu.cn/help/flutter/
export PUB_HOSTED_URL=https://mirrors.tuna.tsinghua.edu.cn/dart-pub
export FLUTTER_STORAGE_BASE_URL=https://mirrors.tuna.tsinghua.edu.cn/flutter
export PATH=/usr/local/programs/flutter/bin:$PATH

# 2024-06-27 mise https://mise.jdx.dev/getting-started.html
if [ $(command -v mise) ]; then
  eval "$(mise activate bash)"
fi
