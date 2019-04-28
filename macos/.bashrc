alias ls='ls -F'
alias l='ls -l'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -alh'
alias vi='vim'

export HOMEBREW_NO_AUTO_UPDATE=1

# Nix
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
    source $HOME/.nix-profile/etc/profile.d/nix.sh;
fi
# Nix - bash completion
if [ -e $HOME/.nix-profile/etc/profile.d/bash-completion.sh ]; then
  source $HOME/.nix-profile/etc/profile.d/bash-completion.sh;
fi
# Nix - chruby
if [ -e $HOME/.nix-profile/share/chruby/chruby.sh ]; then
  source $HOME/.nix-profile/share/chruby/chruby.sh
fi

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

# 2018,07,20 Tex Live 2018
# https://tug.org/texlive/upgrade.html
export PATH=/usr/local/texlive/2018/bin/x86_64-darwin:$PATH

# 2018-12-12 Haskell ghcup
export PATH=$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH

# 2019-02-09 OCaml opam
test -r $HOME/.opam/opam-init/init.sh && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

source $HOME/projects/configurations/rcs/swiftenv.sh
