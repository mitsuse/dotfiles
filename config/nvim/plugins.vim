"" neocomplete
let g:deoplete#enable_at_startup = 1

"" deoplete-jedi
let g:python_host_prog = $GITHUB_ME . '/dotfiles/tools/anyenv/envs/pyenv/shims/python2'
let g:python3_host_prog = $GITHUB_ME . '/dotfiles/tools/anyenv/envs/pyenv/shims/python3'

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
\   '$HOME/.config/nvim/snippets',
\]

"" sonic-template
let g:sonictemplate_vim_template_dir = '$HOME/.config/nvim/templates'

"" vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"" vim-prettier
autocmd BufWrite *.js Prettier

"" fakeclip
set clipboard=unnamed

"" vim-racer
set hidden
let g:racer_cmd = '/usr/local/bin/racer'


"" ale
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
\ 'python': ['mypy'],
\ 'swift': [],
\ }

let g:ale_fixers = {
\ 'python': ['yapf'],
\ 'swift': [],
\ }
