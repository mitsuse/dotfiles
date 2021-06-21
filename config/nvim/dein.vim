if &compatible
    set nocompatible
endif

set runtimepath^=$GITHUB_ME/dotfiles/tools/dein.vim/

call dein#begin(expand('~/.cache/nvim/dein'))


"===============================================================================
" General Plugins
"===============================================================================

call dein#local($GITHUB_ME, {}, [
\   'bombay.vim',
\])

call dein#add('Shougo/vimproc.vim', {'build': 'make'})

"" Unite
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/unite-outline')
call dein#add('Shougo/neomru.vim')
call dein#add('kannokanno/unite-dwm')
call dein#add('ujihisa/unite-locate')

"" Completion
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/deoplete.nvim')

"" Edit
call dein#add('haya14busa/incsearch.vim')
call dein#add('mattn/sonictemplate-vim')
call dein#add('thinca/vim-quickrun')
call dein#add('tomtom/tcomment_vim')
call dein#add('vim-scripts/matchit.zip')

"" Window

call dein#local($GITHUB_ME, {}, [
\   'dwm.vim',
\])

"" Lint
call dein#add('w0rp/ale')


"===============================================================================
" Language Specific Plugins
"===============================================================================

"" Python
call dein#add('zchee/deoplete-jedi')

"" English
call dein#add('ujihisa/neco-look')

"" Markdown
call dein#add('tpope/vim-markdown')

call dein#end()

filetype plugin indent on
