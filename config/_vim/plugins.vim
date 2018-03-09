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

let g:neosnippet#snippets_directory = [
\   '$HOME/.config/_vim/snippets',
\]

"" sonic-template
let g:sonictemplate_vim_template_dir = '$HOME/.config/_vim/templates'

"" vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"" vim-prettier
autocmd BufWrite *.js Prettier

"" fakeclip
set clipboard=unnamed
