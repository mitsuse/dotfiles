"" kobito
"" - http://qiita.com/Linda_pp/items/ec458977a6552050855b
function! s:open_kobito(...)
    if a:0 == 0
        call system('open -a Kobito '.expand('%:p'))
    else
        call system('open -a Kobito '.join(a:000, ' '))
    endif
endfunction

" open files in Kobito
" ... if no arguments are passed to open_kobito, open the current buffer
command! -nargs=* Kobito call s:open_kobito(<f-args>)

" close Kobito
command! -nargs=0 KobitoClose call system("osascript -e 'tell application \"Kobito\" to quit'")

" focus on Kobito
command! -nargs=0 KobitoFocus call system("osascript -e 'tell application \"Kobito\" to activate'")

" format HTML.
function! s:format_html(...)
    :%s/<[^>]*>/\r&\r/g
    :g/^ *$/d
endfunction

command! -nargs=0 FormatHtml call s:format_html()
