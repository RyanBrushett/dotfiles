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
export KUBECONFIG=$HOME/.kube/config
path=($HOME/.cargo/bin $path)
path=(/usr/local/opt/coreutils/libexec/gnubin $GOPATH/bin $path)
path=(/usr/local/opt/curl/bin $path)
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(${fpath} "/opt/dev/sh/autocomplete/zsh")
autoload -U compinit
compinit

if [[ -f ~/.zshrc_aliases ]]; then source ~/.zshrc_aliases; fi
if [[ -f ~/.zshrc_functions ]]; then source ~/.zshrc_functions; fi
if [[ -f ~/.zshrc_additional ]]; then source ~/.zshrc_additional; fi

export EDITOR=/usr/local/bin/nvim
export LANGUAGE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

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

bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

autoload -U promptinit; promptinit
prompt pure

GOOGLE_FILES_TO_SOURCE=(
  '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
  '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
)
for i in $GOOGLE_FILES_TO_SOURCE; do
  if [[ -f $i ]]; then source $i; fi
done

if [[ -f /opt/dev/sh/chruby/chruby.sh ]]; then source /opt/dev/sh/chruby/chruby.sh; fi
if [[ -f /opt/dev/dev.sh ]]; then source /opt/dev/dev.sh; fi;

chruby 2.6.2
