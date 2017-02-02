export ZSH=$HOME/.oh-my-zsh
DISABLE_UPDATE_PROMPT=true
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000
IFS=$'\n\t'

setopt appendhistory extendedglob nomatch
unsetopt autocd beep notify
bindkey -v
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit

plugins=(osx history-substring-search) 
source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/history-substring-search/history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
disable r

PROMPT="%F{2}%n%f %F{4}%1~%f %# "
export MANPATH="/usr/share/man:/usr/local/share/man:/usr/X11/share/man"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export GOPATH="$HOME"
export EDITOR=/usr/bin/vim

typeset -U path
path=(/usr/local/opt/coreutils/libexec/gnubin $GOPATH/bin $path)
fpath=(/usr/local/share/zsh-completions $fpath)

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias googler="googler -n3"
alias weather="curl wttr.in/ottawa"
alias weathersj="curl wttr.in/yyt"
alias parrot="parrot -delay 50 -loops 4"
alias hurrdurr="echo 'ᕕ( ᐛ )ᕗ'"
alias gfa='git fetch --all --prune;'

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
if [[ -f /opt/dev/dev.sh ]]; then source /opt/dev/dev.sh; fi
if [[ -f ~/.zshrc_additional ]]; then source ~/.zshrc_additional; fi

chruby 2.3.3

