#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

shopt -s checkwinsize

# 2012-05-25
alias vi='vim'
alias l='ls -l'
alias la='ls -la'
alias ll='ls -lhF'

# 2012,08,14
alias grep='grep --color'

# 2013,01,12 for yaourt
export EDITOR="vim"

# New terminals adopt current directory
# https://wiki.archlinux.org/index.php/GNOME
#source /etc/profile.d/vte.sh

source ~/rcs/android-emulator.sh
source ~/rcs/android-sdk.sh
source ~/rcs/cargo.sh
source ~/rcs/carp.sh
source ~/rcs/dotnet.sh
source ~/rcs/flutter.sh
source ~/rcs/go.sh
source ~/rcs/nvm.sh
source ~/rcs/rustup.sh
source ~/rcs/rusty-tags.sh
source ~/rcs/stack.sh
source ~/rcs/texlive.sh

#source ~/rcs/opam.sh
#source ~/rcs/pyenv.sh
#source ~/rcs/rbenv.sh
#source ~/rcs/rvm.sh
#source ~/rcs/linuxbrew.sh

source /usr/share/chruby/chruby.sh
