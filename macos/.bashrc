alias ls='ls -F'
alias l='ls -l'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -alh'
alias vi='vim'

export HOMEBREW_NO_AUTO_UPDATE=1

# DocBook/AsciiDoc
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

export MONO_GAC_PREFIX="/usr/local"

export GOPATH=$HOME/goext

export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$GOPATH/bin:$PATH

# 2018,03,31 chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh

# 2018,04,12 Groovy
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# 2018,04,16 Python tools
export PATH=$HOME/Library/Python/3.7/bin:$PATH

# 2018,04,17 Tex Live 2017
#export PATH=/usr/local/texlive/2017/bin/x86_64-darwin:$PATH
# 2018,07,20 Tex Live 2018
# https://tug.org/texlive/upgrade.html
export PATH=/usr/local/texlive/2018/bin/x86_64-darwin:$PATH

# 2018,04,17 NVM for Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# 2018-12-12 Haskell ghcup
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

# 2019-02-09 OCaml opam
test -r $HOME/.opam/opam-init/init.sh && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

source $HOME/projects/configurations/rcs/swiftenv.sh
