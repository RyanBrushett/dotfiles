HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000
setopt appendhistory extendedglob nomatch
unsetopt autocd beep notify
bindkey -v
bindkey '^R' history-incremental-search-backward
zstyle :compinstall filename '$HOME/.zshrc'

typeset -U path
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

if [[ -f ~/.zshrc_aliases ]]; then source ~/.zshrc_aliases; fi
if [[ -f ~/.zshrc_functions ]]; then source ~/.zshrc_functions; fi
if [[ -f ~/.zshrc_additional ]]; then source ~/.zshrc_additional; fi

export EDITOR=/opt/homebrew/bin/nvim
export LANGUAGE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/Users/$(whoami)/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

export GOPATH=$HOME
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

if command -v chruby &> /dev/null; then
  chruby 3.2.0
fi

