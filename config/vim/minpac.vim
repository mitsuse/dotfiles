packadd minpac

call minpac#init()

call minpac#add('mitsuse/bombay.vim', {'dir': $GITHUB_ME})

" Editing
call minpac#add('haya14busa/incsearch.vim')
call minpac#add('tomtom/tcomment_vim')
call minpac#add('dense-analysis/ale')

" Window
call minpac#add('spolu/dwm.vim')

"" Unite
call minpac#add('Shougo/unite.vim')
call minpac#add('Shougo/unite-outline')
call minpac#add('Shougo/neomru.vim')
call minpac#add('kannokanno/unite-dwm')

"" Completion
call minpac#add('prabirshrestha/asyncomplete.vim')
call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
call minpac#add('prabirshrestha/vim-lsp')
call minpac#add('mattn/vim-lsp-settings')

"" Syntax Highlight
call minpac#add('MaxMEllon/vim-jsx-pretty')
call minpac#add('joerdav/templ.vim')

filetype plugin indent on
