"" Import configs.
source $HOME/.config/vim/minpac.vim
source $HOME/.config/vim/plugins.vim
source $HOME/.config/vim/keybinds.vim

"" Appearance
syntax on
colorscheme bombay
set ruler
set hlsearch
set wildmenu
set cursorline
set list
set listchars=tab:>.,trail:･,eol:↲,nbsp:%
set re=0

"" Indentation
set autoindent
set smartindent
set expandtab
set shiftround
set tabstop=2
set shiftwidth=2

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

"" Workaround: https://github.com/neovim/neovim/issues/3094
set ttimeout
set ttimeoutlen=50

"" Completion
set completeopt=menuone

if executable('swim')
    autocmd InsertLeave * :call system('swim use com.apple.keylayout.ABC')
endif
