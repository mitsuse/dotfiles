"" unite
let g:unite_enable_start_insert = 1

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

let g:neosnippet#snippets_directory = [
            \   '$HOME/.vim/snippets',
            \]

"" sonic-template
let g:sonictemplate_vim_template_dir = '$HOME/.vim/templates'

"" jedi
autocmd FileType python setlocal completeopt-=preview
let g:jedi#show_call_signatures = "1"
let g:jedi#popup_on_dot = 0

"" vim-go
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = ""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

"" vim-jsfmt
let g:js_fmt_command = "jsfmt"
let g:js_fmt_autosave = 1

"" vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"" jshint2
let jshint2_read = 1
let jshint2_save = 1

"" emmet-vim
let g:user_emmet_leader_key='<C-E>'

"" fakeclip
set clipboard=unnamed