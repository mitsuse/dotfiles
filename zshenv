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

export ANYENV_ROOT=${GITHUB_ME}/dotfiles/tools/anyenv
eval "$(anyenv init - zsh)"


# Tools installed by Homebrew
export HOMEBREW_NO_EMOJI=0
export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH

eval "$(direnv hook zsh)"


# set the type to each environment variable.
typeset -U path PATH
