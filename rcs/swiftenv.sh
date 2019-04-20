# swiftenv https://swiftenv.fuller.li/en/latest/installation.html
# Run `git clone https://github.com/kylef/swiftenv.git ~/.swiftenv` first.
export SWIFTENV_ROOT="$HOME/.swiftenv"
export PATH="$SWIFTENV_ROOT/bin:$PATH"
if which swiftenv > /dev/null; then
  eval "$(swiftenv init -)";
fi
