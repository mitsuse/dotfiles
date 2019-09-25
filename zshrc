# load more specific config files
# for CONFIG_PATH in $HOME/.zshrc_*
[ -f $HOME/.zsh/zshrc_env ] && source $HOME/.zsh/zshrc_env
[ -f $HOME/.zsh/zshrc_tools ] && source $HOME/.zsh/zshrc_tools
[ -f $HOME/.zsh/zshrc_command ] && source $HOME/.zsh/zshrc_command
[ -f $HOME/.zsh/zshrc_hooks ] && source $HOME/.zsh/zshrc_hooks
[ -f $HOME/.zsh/zshrc_brew -a $(uname) = 'Darwin' ] && source $HOME/.zsh/zshrc_brew
[ -f $HOME/.zsh/zshrc_go ] && source $HOME/.zsh/zshrc_go
[ -f $HOME/.zsh/zshrc_rust ] && source $HOME/.zsh/zshrc_rust
[ -f $HOME/.zsh/zshrc_node ] && source $HOME/.zsh/zshrc_node
[ -f $HOME/.zsh/zshrc_python ] && source $HOME/.zsh/zshrc_python
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
