"" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#dictionary#dictionaries = {
\   'default': '',
\   'tex': $HOME.'/.config/_vim/dict/tex.dict',
\ }


"" unite
let g:unite_enable_start_insert = 1

if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
endif


"" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)


"" dein
set runtimepath^=$GITHUB_ME/dotfiles/tools/dein.vim/

call dein#begin(expand('~/.cache/vim/dein'))

call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/unite-outline')

call dein#add('haya14busa/incsearch.vim')
call dein#add('kannokanno/unite-dwm')
call dein#add('spolu/dwm.vim')
call dein#add('tomtom/tcomment_vim')
call dein#add('ujihisa/neco-look')
call dein#add('ujihisa/unite-locate')
call dein#add('vim-scripts/matchit.zip')

call dein#local($GITHUB_ME, {}, ['bombay.vim'])


call dein#end()

filetype plugin indent on


"" Appearance
syntax on
colorscheme bombay
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

if executable('swim')
    autocmd InsertLeave * :call system('swim use com.apple.keylayout.ABC')
endif


"" Indentation
set shiftwidth=4 tabstop=4 softtabstop=4
autocmd! FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType scala setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2


"" Standard vim commands
nnoremap ;; q:a
nnoremap ;h :help<space>
nnoremap ;t :tabnew<space>
nnoremap ;w :w
nnoremap ;q :q
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap <C-a> :set spell!<CR>
nmap <silent> <Esc><Esc> :nohlsearch<CR>


"" Unite
nnoremap zn :UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap zp :UniteWithProjectDir -buffer-name=file file file/new<CR>
nnoremap zb :Unite -buffer-name=buffers buffer<CR>
nnoremap zt :Unite -buffer-name=tabs tab<CR>
nnoremap zh :Unite -buffer-name=files file file_mru file/new locate<CR>
nnoremap zo :Unite -buffer-name=outline outline<CR>
nnoremap zm :Unite -buffer-name=dwm dwm<CR>
nnoremap zg :Unite -buffer-name=grep grep:.<CR>


"" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
