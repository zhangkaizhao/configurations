# 1) Zsh Configuration Files https://www.baeldung.com/linux/zsh-configuration-files
# 2) https://superuser.com/a/457892/477397
# > `~/.profile` is only loaded when running `zsh` in `sh` compatibility mode,
# > otherwise it reads `.zprofile`,
# > as well as `.zshrc` for interactive and `.zlogin` for login shells.

if [ -f ~/.profile ]; then
    . ~/.profile
fi
