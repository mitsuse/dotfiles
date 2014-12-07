"" NeoBundle
set nocompatible
filetype plugin indent off

if has('vim_starting')
    set runtimepath+=~/.vim/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/vimproc', {'build': {
            \ 'mac': 'make -f make_mac.mak',
            \ 'unix': 'make -f make_unix.mak'}}

"" My plugins
NeoBundle 'bombay.vim', {
            \ 'base': $HOME . '/dotfiles/config/vim/develop',
            \ 'type': 'nosync'
            \}

NeoBundle 'neocomplete-ngram-vim', {
            \ 'base': $HOME . '/dotfiles/config/vim/develop/',
            \ 'type': 'nosync'
            \}

"" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'kannokanno/unite-dwm'

"" Development
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'cohama/agit.vim'

"" Completion
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'mattn/sonictemplate-vim'

"" Edit
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'kana/vim-fakeclip'

"" Window
NeoBundle 'spolu/dwm.vim'
NeoBundle 'Shougo/vinarise.vim'

"" File type
NeoBundle 'fatih/vim-go'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'othree/html5.vim'
NeoBundle 'jdonaldson/vaxe'

"" Others
NeoBundle 'guns/xterm-color-table.vim'

filetype plugin indent on
