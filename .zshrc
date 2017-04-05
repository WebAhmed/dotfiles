# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# loading aliases
source ~/.aliases

# vars
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
