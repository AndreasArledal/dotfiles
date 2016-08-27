# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[ -s "/Users/andreasarledal/.scm_breeze/scm_breeze.sh" ] && source "/Users/andreasarledal/.scm_breeze/scm_breeze.sh"

export NVM_DIR="/Users/andreasarledal/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="/usr/local/sbin:$PATH"
