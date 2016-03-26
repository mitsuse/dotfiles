"" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#dictionary#dictionaries = {
\   'default': '',
\   'swift': $GITHUB_ME.'/autocomplete-swift/keyword.txt',
\   'tex': $HOME.'/.config/_vim/dict/tex.dict',
\ }

"" autocomplete-swift (if neosnippet doesn't exsist)
" autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)

"" Import *Vim-common config.
source $HOME/.config/_vim/plugins.vim
