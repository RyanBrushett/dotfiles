# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
TIMEFMT=$'real\t%E\nuser\t%U\nsys\t%S'

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY             # Share history between all ses
setopt inc_append_history
setopt append_history extendedglob nomatch
unsetopt autocd beep notify
bindkey -v
bindkey '^R' history-incremental-search-backward
zstyle :compinstall filename '$HOME/.zshrc'

typeset -U path
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  FPATH=~/.rbenv/completions:"$FPATH"
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

bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

export GOPATH=$HOME
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

if command -v chruby &> /dev/null; then
  chruby 3.4.7
fi

PATH="$PATH:$HOME/.rd/bin"
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/Users/ryan.brushett/.bunv/versions/1.3.5/_bun" ] && source "/Users/ryan.brushett/.bunv/versions/1.3.5/_bun"
