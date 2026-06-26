# ---- Powerlevel10k instant prompt
# Must stay near the top of ~/.zshrc. Anything needing console input
# (password prompts, [y/n] confirmations) must run ABOVE this block.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme ]]; then
  source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
fi

# ---- PATH
typeset -U path                          # auto de-duplicate PATH entries

export GOPATH=$HOME
export GOBIN=$GOPATH/bin

path=(
  /opt/homebrew/opt/mysql@8.0/bin        # prepend: win over any system mysql
  $path
  $GOBIN
  $HOME/.rd/bin
)
export PATH

# ---- Completion
# Load brew's completion functions, then init. Rebuild the dump at most once a
# day; otherwise reuse the cache (-C) to keep shell startup fast.
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
autoload -Uz compinit
if [[ -n $(find ~/.zcompdump -mtime +1 2>/dev/null) ]]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true

# ---- History
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

setopt EXTENDED_HISTORY          # Write history in ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY             # Share history across all sessions.

# ---- Shell options
setopt extendedglob nomatch
unsetopt autocd beep notify
TIMEFMT=$'real\t%E\nuser\t%U\nsys\t%S'    # output format for the `time` builtin

# ---- Keybindings
bindkey -v                                             # vi mode
bindkey '^R' history-incremental-search-backward
bindkey '^[a' beginning-of-line
bindkey '^[e' end-of-line

# ---- Environment
export EDITOR=/opt/homebrew/bin/nvim
export LANGUAGE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export HOMEBREW_NO_ASK=1
export HOMEBREW_REQUIRE_TAP_TRUST=1
export HOMEBREW_NO_UPGRADE_QUIT_CASKS=1
export HOMEBREW_NO_UPGRADE_AUTO_UPDATES_CASKS=1

# ---- Tools
if command -v chruby &>/dev/null; then
  chruby 4.0.2
fi
if [[ -x /opt/homebrew/bin/wtp ]]; then eval "$(wtp shell-init zsh)"; fi

# ---- Sourced extras (~/.zshrc_additional is untracked, for local overrides)
[[ -f ~/.zshrc_aliases ]]    && source ~/.zshrc_aliases
[[ -f ~/.zshrc_functions ]]  && source ~/.zshrc_functions
[[ -f ~/.zshrc_additional ]] && source ~/.zshrc_additional

# ---- Powerlevel10k prompt config (run `p10k configure` or edit ~/.p10k.zsh)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
