## General

alias ls='ls -F'
alias l='ls -l'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -alh'
alias vi='vim'

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

## Homebrew

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

export HOMEBREW_GITHUB_API_TOKEN=""

# 2021-04-15 https://mirrors.ustc.edu.cn/help/homebrew-bottles.html
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"

# 2021-06-18 Homebrew uses `/usr/local/sbin` now.
export PATH="/usr/local/sbin:$PATH"

## Nix

#if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
#  source $HOME/.nix-profile/etc/profile.d/nix.sh;
#fi
#
## Nix - chruby
#if [ -e $HOME/.nix-profile/share/chruby/chruby.sh ]; then
#  source $HOME/.nix-profile/share/chruby/chruby.sh
#fi

## Other misc

# user bins
export PATH=$HOME/bin:$PATH

# Rust Rustup
export PATH=$HOME/.cargo/bin:$PATH
# Use ustc mirror: https://mirrors.ustc.edu.cn/help/rust-static.html
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

# Go
export GOPATH=$HOME/goext
export PATH=$GOPATH/bin:$PATH

# 2018,04,17 Node.js NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# 2018-12-12 Haskell ghcup
export PATH=$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH

# 2019-02-09 OCaml opam
test -r $HOME/.opam/opam-init/init.sh && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# swiftenv https://swiftenv.fuller.li/en/latest/installation.html
# Run `git clone https://github.com/kylef/swiftenv.git ~/.swiftenv` first.
export SWIFTENV_ROOT="$HOME/.swiftenv"
export PATH="$SWIFTENV_ROOT/bin:$PATH"
if which swiftenv > /dev/null; then
  eval "$(swiftenv init -)";
fi

# 2021-12-04 for ConTeXt https://wiki.contextgarden.net/Installation
#export PATH=/usr/local/programs/context/tex/texmf-osx-64/bin:$PATH

# 2021-12-04 for TeX Live 2021 https://www.tug.org/texlive/quickinstall.html
export PATH="/usr/local/texlive/2021/bin/universal-darwin:$PATH"

# 2021-12-05 Python tools
export PATH=$HOME/Library/Python/3.8/bin:$PATH

# 2021-12-06 Deno https://deno.land/
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# 2021-12-11 ponyup https://github.com/ponylang/ponyup
# libressl is required via `brew install libressl`.
export PATH=$HOME/.local/share/ponyup/bin:$PATH

# 2021-12-14 rbenv https://github.com/rbenv/rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if [ -f $HOME/.rbenv/bin/rbenv ]; then
  eval "$(rbenv init - bash)"
fi
# ruby-build https://github.com/rbenv/ruby-build
export RUBY_BUILD_MIRROR_URL="https://repo.huaweicloud.com/ruby/ruby/"

# 2021-12-20 git commit with gpg sign issue https://stackoverflow.com/q/41052538/3449199
# Some explanation: https://samuelsson.dev/sign-git-commits-on-github-with-gpg-in-macos/
export GPG_TTY=$(tty)
