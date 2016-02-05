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
export EDITOR=vim

export PATH=$HOME/bin:$HOME/dotfiles/bin:$PATH
autoload -U compinit && compinit
autoload -U predict-on && predict-on
compdef -d ssh java adb
setopt auto_cd

# load more specific config files
# for CONFIG_PATH in $HOME/.zshrc_*
[ -f $HOME/.zsh/zshrc_env ] && source $HOME/.zsh/zshrc_env
[ -f $HOME/.zsh/zshrc_tools ] && source $HOME/.zsh/zshrc_tools
[ -f $HOME/.zsh/zshrc_command ] && source $HOME/.zsh/zshrc_command
[ -f $HOME/.zsh/zshrc_hooks ] && source $HOME/.zsh/zshrc_hooks
[ -f $HOME/.zsh/zshrc_go ] && source $HOME/.zsh/zshrc_go
[ -f $HOME/.zsh/zshrc_node ] && source $HOME/.zsh/zshrc_node
[ -f $HOME/.zsh/zshrc_brew ] && source $HOME/.zsh/zshrc_brew
[ -f $HOME/.zsh/zshrc_osx ] && source $HOME/.zsh/zshrc_osx
[ -f $HOME/.zsh/zshrc_misc ] && source $HOME/.zsh/zshrc_misc
[ -f $HOME/.zsh/zshrc_alias ] && source $HOME/.zsh/zshrc_alias

[ -f $HOME/.zshrc_other ] && source $HOME/.zshrc_other

# use a simple prompt
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

eval "$(direnv hook zsh)"
