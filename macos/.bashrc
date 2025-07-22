#----------
# General
#----------

export EDITOR="vim"

alias ls="ls -F"
alias ll="ls -lh"
alias vi="vim"

# 2023-07-30 open files limit:
# 0) https://gist.github.com/tombigel/d503800a282fcadbee14b537735d202c
# 1) https://docs.riak.com/riak/kv/2.2.3/using/performance/open-files-limit/
# 2) https://apple.stackexchange.com/a/366319
ulimit -n 524288
#ulimit -u 2048

# prepend path and remove duplicates from PATH https://superuser.com/a/462852/477397
_prepend_path() {
    PATH=${PATH//":$1"/} # delete any instances in the middle or at the end
    PATH=${PATH//"$1:"/} # delete any instances at the beginning
    export PATH="$1:$PATH" # prepend to beginning
}

#-----------
# Programs
#-----------

# Bash itself

# Turn off the beep https://unix.stackexchange.com/a/593495/126066
bind "set bell-style none"

# https://github.com/scop/bash-completion
# The last release for Bash 3.2 is 1.3 (latest version of Bash on macOS).
# https://github.com/scop/bash-completion/archive/1.3.zip
# Download it and unzip to $HOME/.bash-completion first.
#if [ -f $HOME/.bash-completion/bash_completion ]; then
#  export BASH_COMPLETION=$HOME/.bash-completion/bash_completion
#  export BASH_COMPLETION_DIR=$HOME/.bash-completion/completions
#  export BASH_COMPLETION_COMPAT_DIR=$HOME/.bash-completion/completions
#  source $HOME/.bash-completion/bash_completion
#  # bash completion support for core Git
#  source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
#  # bash completion support for Homebrew
#  if [ -f /usr/local/Homebrew/completions/bash/brew ]; then
#    source /usr/local/Homebrew/completions/bash/brew
#  fi
#fi

# 2024-10-04 pkgsrc and pkgin
_prepend_path "/opt/pkg/sbin"
_prepend_path "/opt/pkg/bin"

# 2021-12-20 git commit with gpg sign issue https://stackoverflow.com/q/41052538/3449199
# Some explanation: https://samuelsson.dev/sign-git-commits-on-github-with-gpg-in-macos/
export GPG_TTY=$(tty)

# TeX Live install: https://www.tug.org/texlive/quickinstall.html
# TeX Live upgrade: https://tug.org/texlive/upgrade.html
_prepend_path "/opt/programs/texlive/2025/bin/universal-darwin"

# 2024-10-06 fastfetch https://github.com/fastfetch-cli/fastfetch
_prepend_path "/opt/programs/fastfetch/usr/bin"
alias fastfetch="fastfetch --cpu-temp --gpu-temp --battery-temp"

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
export GOPATH="/opt/programs/goext"
_prepend_path "/opt/programs/goext/bin"

# 2022-04-02 Goproxy.cn https://goproxy.cn/
export GO111MODULE=on
export GOPROXY="https://goproxy.cn"

# Rust rustup https://rust-lang.github.io/rustup/environment-variables.html
export RUSTUP_HOME="/opt/programs/rustup"

# Rust rustup https://mirrors.ustc.edu.cn/help/rust-static.html
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

# Rust Cargo https://doc.rust-lang.org/cargo/reference/environment-variables.html
export CARGO_HOME="/opt/programs/cargo"
_prepend_path "/opt/programs/cargo/bin"

# Haskell GHCup https://www.haskell.org/ghcup/guide/
export GHCUP_INSTALL_BASE_PREFIX="/opt/programs/haskell"
_prepend_path "/opt/programs/haskell/.ghcup/bin"

# Haskell Cabal https://cabal.readthedocs.io/en/stable/config.html
export CABAL_DIR="/opt/programs/haskell/cabal"
_prepend_path "/opt/programs/haskell/cabal/bin"

# OCaml opam https://opam.ocaml.org/doc/Manual.html
export OPAMROOT="/opt/programs/opam"

# OCaml opam: opam init -v
if [ -r "/opt/programs/opam/opam-init/init.sh" ]; then
  source "/opt/programs/opam/opam-init/init.sh" > /dev/null 2> /dev/null || true
fi

# Idris2
_prepend_path "/opt/programs/idris2/bin"

# C2 http://c2lang.org/
export C2_LIBDIR="/opt/programs/c2c/libs"
export C2_PLUGINDIR="/opt/programs/c2c/plugins"

# user binaries
_prepend_path "$HOME/bin"

# 2024-06-27 mise https://mise.jdx.dev/getting-started.html
if [ $(command -v mise) ]; then
    eval "$(mise activate bash)"
    #eval "$(mise activate --shims bash)"
fi

#----------
# Other general but must be placed at the bottom
#----------

# remove duplicates from PATH https://unix.stackexchange.com/a/40973/126066
if [ -n "$PATH" ]; then
  old_PATH=$PATH:; PATH=
  while [ -n "$old_PATH" ]; do
    x=${old_PATH%%:*}       # the first remaining entry
    case $PATH: in
      *:"$x":*) ;;          # already there
      *) PATH=$PATH:$x;;    # not there yet
    esac
    old_PATH=${old_PATH#*:}
  done
  PATH=${PATH#:}
  unset old_PATH x
fi
