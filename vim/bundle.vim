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

"" Development
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-themis'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tokorom/syntastic-swiftlint.vim'

"" Completion
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'mattn/sonictemplate-vim'

"" Edit
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'haya14busa/incsearch.vim'

"" Window
NeoBundle 'spolu/dwm.vim'

"" File type
NeoBundle 'fatih/vim-go'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'keith/swift.vim'

if filereadable(expand('$HOME/.bundle_dev.vim'))
    source $HOME/.bundle_dev.vim
endif

call neobundle#end()

filetype plugin indent on
