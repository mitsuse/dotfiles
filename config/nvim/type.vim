" default
set shiftwidth=4 tabstop=4 softtabstop=4

"" tex
let g:tex_flavor = 'latex'

"" Go
autocmd! FileType go autocmd BufWritePre <buffer> Fmt

"" Indentation
autocmd! FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType scala setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2

"" fastlane
au BufNewFile,BufRead Fastfile set ft=ruby
