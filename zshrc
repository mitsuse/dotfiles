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


export GHQROOT=$HOME/projects
export GITHUB_ROOT=$GHQROOT/src/github.com
export GITHUB_ME=$GITHUB_ROOT/$(whoami)
export GITLAB_ROOT=$GHQROOT/src/gitlab.com
export GITLAB_ME=$GITLAB_ROOT/$(whoami)

if [ "${$(hostname)##*.}" = 'local' ]; then
    export TMUX_STATUS_BG=colour31
    export TMUX_STATUS_CURRENT_BG=colour195
else
    export TMUX_STATUS_BG=colour105
    export TMUX_STATUS_CURRENT_BG=colour189
fi


# Tools
for tool_path in $(find ${GITHUB_ME}/dotfiles/tools -maxdepth 1 ! -name '.*')
do
    if [ -d $tool_path/bin ]; then
        export PATH=$tool_path/bin:$PATH
    fi
done

eval "$(pyenv init --path)"
eval "$(rbenv init - zsh)"


# Tools installed by Homebrew
export HOMEBREW_NO_EMOJI=0
export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH

eval "$(direnv hook zsh)"


# set the type to each environment variable.
typeset -U path PATH


# Commands
function tmux_attach() {
    tmux attach 2>/dev/null
    if [ "$?" -eq 1 ]; then 
        tmux
    fi
}
alias t="tmux_attach"

function pip_match() {
    pip search $1 | grep "^$1 "
}

function cd_ghq() {
    local selected_path=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "${selected_path}" ]; then
        BUFFER="cd ${selected_path}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N cd_ghq
bindkey '^]' cd_ghq

function fg_job() {
    fg
}
zle -N fg_job
bindkey '^z' fg_job

function ffmpeg_twitter() {
    ffmpeg -i ${1} -b:v 25m -r 40 ${2}
}

alias date8="date +%Y%m%d"

function rmdd() {
    rm -rf ~/Library/Developer/Xcode/DerivedData
}

# Avoid adding some commands into the history.
zshaddhistory() {
    local line=${1%%$'\n'}
    local cmd=${line%% *}
    [[\
        "${cmd}" != "openssl" &&
        "${cmd}" != "gm" &&
        "${cmd}" != "rm" &&
        "${cmd}" != "mv"
    ]]
}

case ${OSTYPE} in
    darwin*)
        [ -f $HOME/.zshrc_osx ] && source $HOME/.zshrc_osx
        ;;
    linux*)
        [ -f $HOME/.zshrc_linux ] && source $HOME/.zshrc_linux
        ;;
esac

alias sudo='sudo '
alias mkdir='mkdir -p '
alias gm='gomi'
alias ptpython='ptpython --vi'
alias diff='colordiff'

[ -f $HOME/.zshrc_other ] && source $HOME/.zshrc_other
