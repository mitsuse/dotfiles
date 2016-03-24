"" NeoBundle
set nocompatible
filetype plugin indent off

if has('vim_starting')
    set runtimepath+=~/.tools/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/vimproc', {'build': {
            \ 'mac': 'make -f make_mac.mak',
            \ 'unix': 'make -f make_unix.mak'}}

"" Colorscheme
NeoBundle 'mitsuse/bombay.vim', 'develop'

"" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'kannokanno/unite-dwm'
NeoBundle 'ujihisa/unite-locate'

"" Completion
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'

"" Edit
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'mattn/sonictemplate-vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'vim-scripts/matchit.zip'

"" Window
NeoBundle 'spolu/dwm.vim'


"===============================================================================
" Language Specific Plugins
"===============================================================================

"" English
NeoBundle 'ujihisa/neco-look'

"" Golang
NeoBundle 'fatih/vim-go'

"" Markdown
NeoBundle 'tpope/vim-markdown'

"" Swift
NeoBundle 'keith/swift.vim'
NeoBundle 'tokorom/syntastic-swiftlint.vim'

"" Vim
NeoBundle 'thinca/vim-themis'


" if filereadable(expand('$HOME/.bundle_dev.vim'))
"     source $HOME/.bundle_dev.vim
" endif
"
" call neobundle#end()
"
" filetype plugin indent on
