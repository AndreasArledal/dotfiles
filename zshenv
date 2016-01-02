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
  $path
)

for path_file in /etc/paths.d/*(.N); do
  path+=($(<$path_file))
done
unset path_file


# vim:ft=sh
