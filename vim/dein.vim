if &compatible
    set nocompatible
endif

set runtimepath^=$GITHUB_ME/dotfiles/tools/dein.vim/

call dein#begin(expand('~/.cache/dein'))

"" Import *Vim-common config.
source $HOME/.config/_vim/dein.vim


"===============================================================================
" General Plugins
"===============================================================================

"" Unite
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/unite-outline')
call dein#add('Shougo/neomru.vim')
call dein#add('kannokanno/unite-dwm')
call dein#add('ujihisa/unite-locate')

"" Completion
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

"" Edit
call dein#add('haya14busa/incsearch.vim')
call dein#add('kana/vim-fakeclip')
call dein#add('mattn/sonictemplate-vim')
call dein#add('scrooloose/syntastic')
call dein#add('thinca/vim-quickrun')
call dein#add('tomtom/tcomment_vim')
call dein#add('vim-jp/vital.vim')
call dein#add('vim-scripts/matchit.zip')

"" Window
call dein#add('spolu/dwm.vim')


"===============================================================================
" Language Specific Plugins
"===============================================================================

"" English
call dein#add('ujihisa/neco-look')

"" Golang
call dein#add('fatih/vim-go')

"" Markdown
call dein#add('tpope/vim-markdown')

"" Swift
call dein#add('keith/swift.vim')
call dein#add('tokorom/syntastic-swiftlint.vim')

"" Vim
call dein#add('thinca/vim-themis')


"===============================================================================
" My Plugins
"===============================================================================

call dein#local($GITHUB_ME, {}, [
\   'bombay.vim',
\   'autocomplete-swift',
\])


call dein#end()

filetype plugin indent on
