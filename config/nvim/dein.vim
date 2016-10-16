if &compatible
    set nocompatible
endif

set runtimepath^=$GITHUB_ME/dotfiles/tools/dein.vim/

call dein#begin(expand('~/.cache/nvim/dein'))

"" Import *Vim-common config.
source $HOME/.config/_vim/dein.vim


"===============================================================================
" General Plugins
"===============================================================================

"" Completion
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-go')

call dein#local($GITHUB_ME, {}, [
\   'autocomplete-swift',
\])

call dein#end()

filetype plugin indent on
