alias vi='vim'
set -g -x EDITOR vim

for _rc in $HOME/rcs/*.fish
  source $_rc
end

source /usr/share/chruby/chruby.fish
