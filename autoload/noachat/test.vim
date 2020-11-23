scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! noachat#test#run()
    let v:errors = []

    call noachat#test#test_filetype#run()

    if len(v:errors) > 0
        echo v:errors

        cquit!
    endif

    echo 'test success'
    qall!
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
