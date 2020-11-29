let s:save_cpo = &cpo
set cpo&vim

function! noachat#test#test_insertText#run()
    let g:noachat#ws = v:true
    call noachat#insertText('test test test')
    let g:naochat#ws = v:false

    let l:expectedValue = ['', '------------------------', '', 'test test test', '']

    let l:fileLineLen = line('$')

    let l:bufferText = getline(1, l:fileLineLen)

    call assert_equal(l:expectedValue, l:bufferText)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
