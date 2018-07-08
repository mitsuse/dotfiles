function! GetSyntax()
    let syntax_id = synIDtrans(synID(line("."), col("."), 0))
    return {
    \   'name': synIDattr(syntax_id, 'name'),
    \   'id': syntax_id,
    \ }
endfunction
