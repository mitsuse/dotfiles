"" Import *Vim-common config.
source $HOME/.config/_vim/keybinds.vim

autocmd FileType swift imap <buffer> <C-j> <Plug>(deoplete_swift_jump_to_placeholder)
