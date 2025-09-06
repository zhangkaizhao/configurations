# References of Fish:
# 1) https://fishshell.com/docs/3.6/language.html
# 2) https://fishshell.com/docs/3.6/commands.html

#----------
# General
#----------

set -gx LANG zh_CN.UTF-8
set -gx EDITOR vim

alias ll "ls -lh"

ulimit -n 524288

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

#-----------
# Programs
#-----------

# Fish shell itself

set -gx PATH "/opt/programs/fish/bin" $PATH

# https://fishshell.com/docs/3.6/faq.html#how-do-i-change-the-greeting-message
#set -U fish_greeting
set -g fish_greeting

# 2021-12-20 git commit with gpg sign issue https://stackoverflow.com/q/41052538/3449199
# Some explanation: https://samuelsson.dev/sign-git-commits-on-github-with-gpg-in-macos/
# 2023-09-30 https://github.com/mitchellh/nixos-config/blob/main/users/mitchellh/config.fish
if isatty
    set -x GPG_TTY (tty)
end

# TeX Live install: https://www.tug.org/texlive/quickinstall.html
# TeX Live upgrade: https://tug.org/texlive/upgrade.html
set -gx PATH "/opt/programs/texlive/2025/bin/universal-darwin" $PATH

# 2024-10-06 fastfetch https://github.com/fastfetch-cli/fastfetch
set -gx PATH "/opt/programs/fastfetch/usr/bin" $PATH

# 2024-10-06 pandoc https://pandoc.org/
set -gx PATH "/opt/programs/pandoc/bin" $PATH

# 2024-11-02 lima https://lima-vm.io/
set -gx PATH "/opt/programs/lima/bin" $PATH

# 2024-09-26 Dart Pub, Flutter and Flutter SDK
# https://mirrors.tuna.tsinghua.edu.cn/help/dart-pub/
# https://mirrors.tuna.tsinghua.edu.cn/help/flutter/
# https://mirrors.tuna.tsinghua.edu.cn/help/flutter-sdk.git/
set -gx PUB_HOSTED_URL "https://mirrors.tuna.tsinghua.edu.cn/dart-pub"
set -gx FLUTTER_STORAGE_BASE_URL "https://mirrors.tuna.tsinghua.edu.cn/flutter"
set -gx FLUTTER_GIT_URL "https://mirrors.tuna.tsinghua.edu.cn/git/flutter-sdk.git"
set -gx PATH "/opt/programs/flutter/bin" $PATH

# 2024-10-08 Python
set -gx PATH "/opt/programs/python/bin" $PATH

# 2024-10-08 Ruby
set -gx PATH "/opt/programs/ruby/bin" $PATH

# 2024-10-08 Erlang
set -gx PATH "/opt/programs/erlang/bin" $PATH

# 2024-10-08 Elixir
set -gx PATH "/opt/programs/elixir/bin" $PATH

# 2024-10-09 Node
set -gx PATH "/opt/programs/node/bin" $PATH

# 2024-10-30 Chez Scheme
set -gx PATH "/opt/programs/chez-scheme/bin" $PATH

# Go
set -gx PATH "/opt/programs/go/bin" $PATH

# Go GOPATH
set -gx GOPATH "/opt/programs/goext"
set -gx PATH "/opt/programs/goext/bin" $PATH

# 2022-04-02 Goproxy.cn https://goproxy.cn/
set -gx GO111MODULE on
set -gx GOPROXY "https://goproxy.cn"

# Rust rustup https://rust-lang.github.io/rustup/environment-variables.html
set -gx RUSTUP_HOME "/opt/programs/rustup"

# Rust rustup https://mirrors.ustc.edu.cn/help/rust-static.html
set -gx RUSTUP_DIST_SERVER "https://mirrors.ustc.edu.cn/rust-static"
set -gx RUSTUP_UPDATE_ROOT "https://mirrors.ustc.edu.cn/rust-static/rustup"

# Rust Cargo https://doc.rust-lang.org/cargo/reference/environment-variables.html
set -gx CARGO_HOME "/opt/programs/cargo"
set -gx PATH "/opt/programs/cargo/bin" $PATH

# Haskell GHCup https://www.haskell.org/ghcup/guide/
set -gx GHCUP_INSTALL_BASE_PREFIX "/opt/programs/haskell"
set -gx PATH "/opt/programs/haskell/.ghcup/bin" $PATH

# Haskell Cabal https://cabal.readthedocs.io/en/stable/config.html
set -gx CABAL_DIR "/opt/programs/haskell/cabal"
set -gx PATH "/opt/programs/haskell/cabal/bin" $PATH

# OCaml opam https://opam.ocaml.org/doc/Manual.html
set -gx OPAMROOT "/opt/programs/opam"

# OCaml opam: opam init -v
if test -f "/opt/programs/opam/opam-init/init.fish"
    source "/opt/programs/opam/opam-init/init.fish" > /dev/null 2> /dev/null; or true
end

# Idris2
set -gx PATH "/opt/programs/idris2/bin" $PATH

# C2 http://c2lang.org/
set -gx C2_LIBDIR "/opt/programs/c2c/libs"
set -gx C2_PLUGINDIR "/opt/programs/c2c/plugins"

# user binaries
set -gx PATH "$HOME/bin" $PATH

# 2024-06-27 mise https://mise.jdx.dev/getting-started.html
type -q mise; and mise activate fish | source
#type -q mise; and mise activate --shims fish | source

# 2024-08-02 proto https://moonrepo.dev/proto
#if type -q proto
#    set -gx PROTO_HOME "$HOME/.proto"
#    set -gx PATH "$PROTO_HOME/shims" "$PROTO_HOME/bin" $PATH
#end
