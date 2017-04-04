CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000
PROMPT="%F{2}%n%f %F{4}%1~%f %# "
setopt appendhistory extendedglob nomatch
unsetopt autocd beep notify
bindkey -v
zstyle :compinstall filename '$HOME/.zshrc'

fpath=(${fpath} "/opt/dev/sh/autocomplete/zsh")
autoload -U compinit
compinit

typeset -U path
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export GOPATH="$HOME"
path=(/usr/local/opt/coreutils/libexec/gnubin $GOPATH/bin $path)
fpath=(/usr/local/share/zsh-completions $fpath)

if [[ -f ~/.zshrc_aliases ]]; then source ~/.zshrc_aliases; fi
if [[ -f ~/.zshrc_functions ]]; then source ~/.zshrc_functions; fi
if [[ -f /opt/dev/sh/chruby/chruby.sh ]]; then source /opt/dev/sh/chruby/chruby.sh; fi
if [[ -f ~/.zshrc_additional ]]; then source ~/.zshrc_additional; fi

chruby 2.3.3
