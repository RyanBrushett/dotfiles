eval `/usr/libexec/path_helper -s`
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000
setopt appendhistory extendedglob nomatch
unsetopt autocd beep notify
bindkey -v
bindkey '^R' history-incremental-search-backward
zstyle :compinstall filename '$HOME/.zshrc'

typeset -U path
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export GOPATH="$HOME"
path=(/usr/local/opt/coreutils/libexec/gnubin $GOPATH/bin $path)
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(${fpath} "/opt/dev/sh/autocomplete/zsh")
autoload -U compinit
compinit

if [[ -f ~/.zshrc_aliases ]]; then source ~/.zshrc_aliases; fi
if [[ -f ~/.zshrc_functions ]]; then source ~/.zshrc_functions; fi
if [[ -f /opt/dev/sh/chruby/chruby.sh ]]; then source /opt/dev/sh/chruby/chruby.sh; fi
if [[ -f ~/.zshrc_additional ]]; then source ~/.zshrc_additional; fi

chruby 2.4.3
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/Users/ryanbrushett/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U promptinit; promptinit
prompt pure
