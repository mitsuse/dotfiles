"" unite
let g:unite_enable_start_insert = 1

"" ale
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
\ 'python': ['ruff', 'mypy'],
\ }

let g:ale_fixers = {
\ 'python': ['ruff_format', 'isort'],
\ }
