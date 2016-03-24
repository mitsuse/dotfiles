"" unite
let g:unite_enable_start_insert = 1

if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
endif

"" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#dictionary#dictionaries = {
\   'default': '',
\   'tex': $HOME.'/.vim/dict/tex.dict',
\ }

"" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

"" autocomplete-swift (if neosnippet doesn't exsist)
" autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)

let g:neosnippet#snippets_directory = [
            \   '$HOME/.vim/snippets',
            \]

"" sonic-template
let g:sonictemplate_vim_template_dir = '$HOME/.vim/templates'

"" vim-go
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = ""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

"" vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"" emmet-vim
let g:user_emmet_leader_key='<C-E>'

"" fakeclip
set clipboard=unnamed

"" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" Import *Vim-common config.
source $HOME/.config/_vim/plugins.vim
