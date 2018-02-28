if &compatible
    set nocompatible
endif

set runtimepath^=$GITHUB_ME/dotfiles/tools/dein.vim/

call dein#begin(expand('~/.cache/nvim/dein'))

"" Import *Vim-common config.
source $HOME/.config/_vim/dein.vim


"===============================================================================
" General Plugins
"===============================================================================

"" Completion
call dein#add('Shougo/deoplete.nvim')

"" Go
call dein#add('vim-jp/vim-go-extra')
call dein#add('zchee/deoplete-go')

"" JavaScript
call dein#add('carlitux/deoplete-ternjs', {
\   'build': 'npm install -g tern',
\})

"" TypeScript
call dein#add('leafgarland/typescript-vim')

"" Rust
call dein#add('rust-lang/rust.vim')
call dein#add('racer-rust/vim-racer')

"" Swift
call dein#local($GITHUB_ME, {}, [
\   'autocomplete-swift',
\])

"" TOML
call dein#add('cespare/vim-toml')

call dein#end()

filetype plugin indent on
