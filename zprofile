# set the type to each environment variable.
typeset -U path PATH

# save command history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history

# search history with history-search-end
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# use vi-like keybinds and set the default editor to vim
bindkey -v
export EDITOR=nvim

export PATH=$HOME/bin:$HOME/dotfiles/bin:$PATH
autoload -U compinit && compinit
autoload -U predict-on && predict-on
compdef -d ssh java adb brew swift
setopt auto_cd

