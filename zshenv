# Aliases
alias han="git"
alias f="fvm flutter"
alias d="fvm dart"

# Defines environment variables

# Browser
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Editors
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Language
if [[ -z "$LANG" ]]; then
  eval "$(locale)"
fi

# Paths
path=(
  $HOME/.bin
  .git/safe/../../bin
  $HOME/code/mndx-dev/bin
  $HOME/.rbenv/shims
  $HOME/Users/andreasarledal/fvm/default/bin
  $path
)

for path_file in /etc/paths.d/*(.N); do
  path+=($(<$path_file))
done
unset path_file


# vim:ft=sh
