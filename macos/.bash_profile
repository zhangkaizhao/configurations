# `man bash` -> INVOCATION
#> ...
# > When bash is invoked as an interactive login shell, or as a non-interactive shell with the --login
# > option, it first reads and executes commands from the file /etc/profile, if that file exists. After
# > reading that file, it looks for ~/.bash_profile, ~/.bash_login, and ~/.profile, in that order, and
# > reads and executes commands from the first one that exists and is readable. The --noprofile option
# > may be used when the shell is started to inhibit this behavior.
# > ...
# > When an interactive shell that is not a login shell is started, bash reads and executes commands from
# > ~/.bashrc, if that file exists. This may be inhibited by using the --norc option. The --rcfile file
# > option will force bash to read and execute commands from file instead of ~/.bashrc.
# > ...

umask 0002

if [ -f ~/.profile ]; then
    . ~/.profile
fi

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
