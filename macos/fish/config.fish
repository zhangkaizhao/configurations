# References of Fish:
# 1) https://fishshell.com/docs/3.6/language.html
# 2) https://fishshell.com/docs/3.6/commands.html

#----------
# General
#----------

set -gx LANG zh_CN.UTF-8
set -gx EDITOR vim

# Correct $PATH
function correct_path
    set PATH ''
    for _file in /etc/paths.d/*
        while read -l _path
            set PATH $PATH $_path
        end < $_file
    end
    while read -l _path
        set PATH $PATH $_path
    end < /etc/paths
    set -e PATH[1]
    set -gx PATH $PATH
end
correct_path

# Correct $MANPATH
function correct_manpath
    set MANPATH ''
    while read -l _path
        set MANPATH $_path $MANPATH
    end < /etc/manpaths
    for _file in /etc/manpaths.d/*
        while read -l _path
            set MANPATH $_path $MANPATH
        end < $_file
    end
    set -e MANPATH[1]
    set -gx MANPATH $MANPATH
end
correct_manpath

# user bins
set -gx PATH "$HOME/bin" $PATH

alias ll "ls -lh"

#-----------
# Programs
#-----------

# Fish shell itself
# https://fishshell.com/docs/3.6/faq.html#how-do-i-change-the-greeting-message
#set -U fish_greeting
set -g fish_greeting

# Homebrew
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -gx HOMEBREW_NO_INSTALL_UPGRADE 1
set -gx HOMEBREW_NO_GITHUB_API 1

# https://mirrors.ustc.edu.cn/help/brew.git.html
set -gx HOMEBREW_BREW_GIT_REMOTE "https://mirrors.ustc.edu.cn/brew.git"

# 2023-09-12 brew 4.0+:
# 1: https://brew.sh/2023/02/16/homebrew-4.0.0/
# 2: https://mirrors.ustc.edu.cn/help/homebrew-bottles.html
set -gx HOMEBREW_BOTTLE_DOMAIN "https://mirrors.ustc.edu.cn/homebrew-bottles"
set -gx HOMEBREW_API_DOMAIN "https://mirrors.ustc.edu.cn/homebrew-bottles/api"

# 2021-06-18 Homebrew uses `/usr/local/sbin` now.
set -gx PATH "/usr/local/sbin" $PATH

# 2023-08-11 MariaDB: brew info mariadb@10.11
set -gx PATH "/usr/local/opt/mariadb@10.11/bin" $PATH

# 2024-01-05 PostgreSQL: brew info postgresql@16
set -gx PATH "/usr/local/opt/postgresql@16/bin" $PATH

# 2021-12-20 git commit with gpg sign issue https://stackoverflow.com/q/41052538/3449199
# Some explanation: https://samuelsson.dev/sign-git-commits-on-github-with-gpg-in-macos/
# 2023-09-30 https://github.com/mitchellh/nixos-config/blob/main/users/mitchellh/config.fish
if isatty
    set -x GPG_TTY (tty)
end

# TeX Live install: https://www.tug.org/texlive/quickinstall.html
# TeX Live upgrade: https://tug.org/texlive/upgrade.html
set -gx PATH "/usr/local/texlive/2024/bin/universal-darwin" $PATH

# 2022-11-13 Doom Emacs https://github.com/doomemacs/doomemacs
# `git clone https://github.com/doomemacs/doomemacs ~/.emacs.d`
# `~/.emacs.d/bin/doom install`
set -gx PATH "$HOME/.emacs.d/bin" $PATH

# Go
set -gx GOPATH "$HOME/goext"
set -gx PATH "$GOPATH/bin" $PATH

# 2022-04-02 Goproxy.cn https://goproxy.cn/
set -gx GO111MODULE on
set -gx GOPROXY https://goproxy.cn

# Rust Rustup
set -gx PATH "$HOME/.cargo/bin" $PATH

# Use ustc mirror: https://mirrors.ustc.edu.cn/help/rust-static.html
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

# 2018-12-12 Haskell ghcup
set PATH "$HOME/.cabal/bin" "$HOME/.ghcup/bin" $PATH

# 2023-11-03 OCaml opam: opam init -v
if test -f "$HOME/.opam/opam-init/init.fish"
    source "$HOME/.opam/opam-init/init.fish" > /dev/null 2> /dev/null; or true
end

# 2024-01-26 Flutter https://mirrors.tuna.tsinghua.edu.cn/help/flutter/
set -gx PUB_HOSTED_URL https://mirrors.tuna.tsinghua.edu.cn/dart-pub
set -gx FLUTTER_STORAGE_BASE_URL https://mirrors.tuna.tsinghua.edu.cn/flutter
set -gx PATH "/usr/local/programs/flutter/bin" $PATH

# 2024-06-27 mise https://mise.jdx.dev/getting-started.html
type -q mise; and mise activate fish | source
