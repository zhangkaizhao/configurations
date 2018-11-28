# Bash completion

[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion.sh ]] && \
	source /usr/local/share/bash-completion/bash_completion.sh

[[ -f $HOME/.bashrc ]] && source $HOME/.bashrc
