"" unite
let g:unite_enable_start_insert = 1

"" ayncomplete.vim
autocmd User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'look',
    \ 'allowlist': ['text', 'markdown'],
    \ 'completor': function('asyncomplete#sources#look#completor'),
    \ })

"" ale
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
\ 'python': ['flake8', 'mypy'],
\ }

let g:ale_fixers = {
\ 'python': ['black', 'isort'],
\ }
