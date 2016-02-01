"" load each config file
source $HOME/.vim/bundle.vim
source $HOME/.vim/plugins.vim
source $HOME/.vim/commands.vim
source $HOME/.vim/keybinds.vim
source $HOME/.vim/type.vim

"" Looks
syntax on
colorscheme bombay
set number
set ruler
set hlsearch
set wildmenu
set cursorline
set list
set listchars=tab:>.,trail:･,eol:↲,nbsp:%

"" Indentation
set autoindent
set smartindent
set expandtab
set shiftround

"" Search
set history=100
set ignorecase
set smartcase
set wrapscan
set incsearch

"" Encoding
set encoding=utf-8
set fileencoding=utf-8

"" No Backup
set nobackup
set noswapfile
set nowritebackup

"" Ignore CJK charactors on spell checking
set spelllang+=cjk

"" Completion
set completeopt=menuone