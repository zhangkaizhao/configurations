## General

# 2019-02-11 https://stackoverflow.com/questions/7165108/in-os-x-lion-lang-is-not-set-to-utf-8-how-to-fix-it
# https://medium.com/@rajsek/zsh-bash-startup-files-loading-order-bashrc-zshrc-etc-e30045652f2e
#export LC_ALL=zh_CN.UTF-8
export LANG=zh_CN.UTF-8

# Alias stuff from https://github.com/MrElendig/dotfiles-alice/blob/master/.zshrc
export CLICOLOR=true
alias ls="ls -F"
alias ll="ls -lh"

# other alias and variables
alias vi="vim"
export EDITOR="vim"

# turn off the beep/bell sound from https://blog.vghaisas.com/zsh-beep-sound/
# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
# unsetopt LIST_BEEP

# simple from https://wiki.archlinux.org/index.php/zsh
autoload -Uz compinit promptinit
compinit
promptinit

prompt restore

# Git Integration from https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

## Plugins

if [[ -f /usr/local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
if [[ -f /usr/local/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
  source /usr/local/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
fi
if [[ -f /usr/local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

## Homebrew

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

# 2018-07-19 wakeofwind
export HOMEBREW_GITHUB_API_TOKEN="1c04781bbe9573ecc17b37bb780662811c470684"

# 2021-04-15 https://mirrors.ustc.edu.cn/help/homebrew-bottles.html
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"

# 2021-06-18 Homebrew uses `/usr/local/sbin` now.
export PATH="/usr/local/sbin:$PATH"

## MacPorts

#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

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

# Haskell Stack
export PATH=$HOME/.local/bin:$PATH

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

# 2021-09-13 `brew info openjdk@11`
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

# 2021-12-01 `brew info chruby`
if [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
fi

# 2021-12-03 for nvui and nvim
export PATH="/usr/local/programs/bin:$PATH"

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

## Other general but must be placed at the bottom

# show hidden files and directories in zsh completions from https://unix.stackexchange.com/a/308322/126066
# Put this at the bottom because some of the above misc settings will invalidate it.
_comp_options+=(globdots)

# vim: set ts=2 sw=2 et:
