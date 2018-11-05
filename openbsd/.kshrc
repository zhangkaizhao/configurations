## Global
. /etc/ksh.kshrc

## Personal

alias vi='vim'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -lah'

export EDITOR='vim'
export PAGER='less'
export CLICOLOR=1

# JDK 1.8
export PATH=/usr/local/jdk-1.8.0/bin:$PATH
# pip --user
export PATH=$HOME/.local/bin:$PATH

# Copy from http://srobb.net/ksh.html
export PS1='${USER}@${HOST%%.*} ${PWD##*/} $ '

# Tab completions
# source: https://github.com/qbit/dotfiles/blob/master/common/dot_ksh_completions
if [ -e $HOME/.ksh_completions ]; then
  . $HOME/.ksh_completions
fi
