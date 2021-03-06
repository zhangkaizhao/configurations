alias ls='ls -F'
alias l='ls -l'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -alh'
alias vi='vim'

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

export HOMEBREW_NO_AUTO_UPDATE=1

export HOMEBREW_GITHUB_API_TOKEN=""

## Nix

#if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
#  source $HOME/.nix-profile/etc/profile.d/nix.sh;
#fi

## Nix - chruby
#if [ -e $HOME/.nix-profile/share/chruby/chruby.sh ]; then
#  source $HOME/.nix-profile/share/chruby/chruby.sh
#fi

## MacPorts

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Haskell Stack
export PATH=$HOME/.local/bin:$PATH

# Rust Rustup
export PATH=$HOME/.cargo/bin:$PATH

# Go
export GOPATH=$HOME/goext
export PATH=$GOPATH/bin:$PATH

# 2018,04,16 Python tools
export PATH=$HOME/Library/Python/3.7/bin:$PATH

# 2018,04,17 Node.js NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# 2019-05-02 TeX Live 2019
# https://tug.org/texlive/upgrade.html
export PATH=/usr/local/texlive/2019/bin/x86_64-darwin:$PATH

# 2018-12-12 Haskell ghcup
export PATH=$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH

# 2019-02-09 OCaml opam
test -r $HOME/.opam/opam-init/init.sh && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

source $HOME/projects/configurations/rcs/swiftenv.sh
