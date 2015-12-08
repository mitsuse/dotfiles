"" NeoBundle
set nocompatible
filetype plugin indent off

if has('vim_starting')
    set runtimepath+=~/.vim/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/vimproc', {'build': {
            \ 'mac': 'make -f make_mac.mak',
            \ 'unix': 'make -f make_unix.mak'}}

"" My plugins
NeoBundle 'bombay.vim', {
            \ 'base': $GITHUB_ROOT . '/dotfiles/config/vim/develop',
            \ 'type': 'nosync'
            \}

NeoBundle 'neocomplete-kompl-vim', {
            \ 'base': $GITHUB_ROOT . '/dotfiles/config/vim/develop/',
            \ 'type': 'nosync'
            \}

"" A frok of 'rhsyd/vim-grammarous'
NeoBundle 'vim-grammarous', {
            \ 'base': $GITHUB_ROOT . '/dotfiles/config/vim/develop/',
            \ 'type': 'nosync'
            \}

"" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'kannokanno/unite-dwm'
NeoBundle 'ujihisa/unite-locate'

"" Development
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/syntastic'

"" Completion
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'mattn/sonictemplate-vim'

"" Edit
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tomtom/tcomment_vim'
" NeoBundle 'townk/vim-autoclose'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'kana/vim-fakeclip'
" NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'haya14busa/incsearch.vim'

"" Window
NeoBundle 'spolu/dwm.vim'
NeoBundle 'Shougo/vinarise.vim'

"" File type
NeoBundle 'fatih/vim-go'
" NeoBundle 'mephux/vim-jsfmt'
NeoBundle 'ahayman/vim-nodejs-complete'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'Quramy/tsuquyomi'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'Quramy/vison'
NeoBundle 'keith/swift.vim'

"" Others
NeoBundle 'guns/xterm-color-table.vim'

call neobundle#end()

filetype plugin indent on
