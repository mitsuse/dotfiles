" format HTML.
function! s:format_html(...)
    :%s/<[^>]*>/\r&\r/g
    :g/^ *$/d
endfunction

command! -nargs=0 FormatHtml call s:format_html()
