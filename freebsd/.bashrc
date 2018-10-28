# Bash completion

[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion.sh ]] && \
    source /usr/local/share/bash-completion/bash_completion.sh

# Bash options

shopt -s checkwinsize

# alias

alias grep='grep --color'
alias l='ls -l'
alias la='ls -la'
alias ll='ls -lhF'
alias svn="svnlite"
alias vi='vim'

# export variables

export CLICOLOR=1
export EDITOR="vim"
export PAGER="less"

# programs

#source ~/rcs/android-emulator.sh
#source ~/rcs/android-sdk.sh
#source ~/rcs/cargo.sh
#source ~/rcs/carp.sh
#source ~/rcs/dotnet.sh
#source ~/rcs/flutter.sh
#source ~/rcs/go.sh
#source ~/rcs/nvm.sh
#source ~/rcs/rustup.sh
#source ~/rcs/rusty-tags.sh
#source ~/rcs/stack.sh
#source ~/rcs/texlive.sh

#source ~/rcs/opam.sh
#source ~/rcs/pyenv.sh
#source ~/rcs/rbenv.sh
#source ~/rcs/rvm.sh
#source ~/rcs/linuxbrew.sh

# 2018-06-27 local bin for pip --user
export PATH=$HOME/.local/bin:$PATH

# chruby
if [[ -f /usr/local/share/chruby/chruby.sh ]]; then
  source /usr/local/share/chruby/chruby.sh
fi
