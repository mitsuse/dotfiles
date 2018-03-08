"" neocomplete
let g:deoplete#enable_at_startup = 1

"" deoplete-jedi
let g:python_host_prog = $GITHUB_ME . '/dotfiles/tools/anyenv/envs/pyenv/shims/python2'
let g:python3_host_prog = $GITHUB_ME . '/dotfiles/tools/anyenv/envs/pyenv/shims/python3'

"" Import *Vim-common config.
source $HOME/.config/_vim/plugins.vim

"" vim-racer
set hidden
let g:racer_cmd = '/usr/local/bin/racer'
