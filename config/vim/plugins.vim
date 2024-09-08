"" unite
let g:unite_enable_start_insert = 1

"" ale
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
\ 'python': ['ruff', 'mypy'],
\ 'typescript': ['eslint'],
\ }

let g:ale_fixers = {
\ 'go': ['gofmt'],
\ 'python': ['ruff_format', 'isort'],
\ 'typescript': ['eslint', 'prettier'],
\ }

"" lsp
let g:lsp_diagnostics_echo_cursor = 1
