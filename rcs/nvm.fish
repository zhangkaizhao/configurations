set -g -x NVM_NODEJS_ORG_MIRROR http://npm.taobao.org/mirrors/node

# NVM for Node.js
set -g -x NVM_DIR /zdata/moredata/nvm
# https://github.com/brigand/fast-nvm-fish
# curl -sSL https://raw.githubusercontent.com/brigand/fast-nvm-fish/master/nvm.fish > ~/.config/fish/functions/nvm.fish
set -U fish_user_paths
