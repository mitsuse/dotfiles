if &compatible
    set nocompatible
endif

set runtimepath^=$GITHUB_ME/dotfiles/tools/dein.vim/

call dein#begin(expand('~/.cache/vim/dein'))

"" Import *Vim-common config.
source $HOME/.config/_vim/dein.vim


"===============================================================================
" General Plugins
"===============================================================================

"" Completion
call dein#add('Shougo/neocomplete.vim')


"===============================================================================
" Language Specific Plugins
"===============================================================================

"" Vim
call dein#add('thinca/vim-themis')

call dein#local($GITHUB_ROOT . '/vim-jp', {}, [
\   '/vital.vim',
\])


"===============================================================================
" My Plugins
"===============================================================================

call dein#local($GITHUB_ME, {}, [
\   'autocomplete-swift',
\])


call dein#end()

filetype plugin indent on
