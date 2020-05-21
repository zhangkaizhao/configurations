# $OpenBSD: dot.profile,v 1.5 2018/02/02 02:29:54 yasuoka Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
export PATH HOME TERM

# Personal

export LANG=en_US.UTF-8

export ENV=$HOME/.kshrc

# JDK 11
export PATH=/usr/local/jdk-11/bin:$PATH
# pip --user
export PATH=$HOME/.local/bin:$PATH
# ghcup 2018-12-07
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
