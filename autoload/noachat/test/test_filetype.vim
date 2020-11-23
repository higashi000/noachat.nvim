let s:save_cpo = &cpo
set cpo&vim

function! noachat#test#test_filetype#run()
    execute(':e test.noachat')
    let isNoachat = noachat#isNoachat()

    call assert_equal(v:true, isNoachat)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
