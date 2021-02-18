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
        source $HOME/.zshrc_osx
        ;;
    linux*)
        source $HOME/.zshrc_linux
        ;;
esac

alias sudo='sudo '
alias mkdir='mkdir -p '
alias gm='gomi'
alias ptpython='ptpython --vi'
alias diff='colordiff'

[ -f $HOME/.zshrc_other ] && source $HOME/.zshrc_other
