# Save command history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history


# Search history with history-search-end
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end


# Use vi-like keybinds and set the default editor to vim
bindkey -v
export EDITOR=vim

export PATH=$HOME/bin:$HOME/dotfiles/bin:$PATH
autoload -U compinit && compinit
autoload -U predict-on && predict-on
compdef -d ssh java adb brew swift


# Use a simple prompt
autoload -U add-zsh-hook
autoload -U vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' formats '(%s) [%b]'

function update_vcs_info_msg() {
    psvar=()
    vcs_info   
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

add-zsh-hook precmd update_vcs_info_msg

autoload -U colors && colors
PROMPT="%B%{${fg[yellow]}%}%~ %1(v|%v|)%b
%{${reset_color}%}[${USER}%B@${HOST}%b]$ "
setopt auto_cd