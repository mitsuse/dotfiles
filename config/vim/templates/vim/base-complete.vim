let s:source = {
     \ 'name': '{{_name_}}',
     \ 'mark': '[{{_name_}}]',
     \}

function! s:source.gather_candidates(context)
    return []
endfunction

function! neocomplete#sources#{{}_name_}#define()
  return s:source
endfunction
