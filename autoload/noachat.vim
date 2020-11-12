function! noachat#insertText(text) abort
    if !g:noachat#ws
        return
    endif

    let insertText = ['------------------------', '', a:text, '']
    call append(1, insertText)
endfunction

function! noachat#sendMsg() abort
    let l:text = input('Post Text :')

    let l:sendText = ''
    if !exists("g:noachat#UserName") || g:noachat#UserName == ''
        let l:sendText = l:sendText.'noname: '.l:text
    else
        let l:sendText = l:sendText.g:noachat#UserName.': '.l:text
    endif

    let l:data =
                \ '"{'
                \ .'\"text\":\"'.l:sendText.'\"'
                \ .'}"'

    let l:sendCmd = 'curl '.g:noachat#SendReqURL.'/send '
                \ .'-X POST -H "Content-Type: application/json" '
                \ .'-d '.l:data

    call system(l:sendCmd)
endfunction


function! noachat#isNoachat() abort
    if &ft == 'noachat'
        return v:true
    else
        return v:false
    endif
endfunction

function! noachat#leaveChat() abort
    let g:noachat#ws = v:false

    if !exists("g:noachat#UserName") || g:noachat#UserName == ''
        let g:noachat#UserName = 'noname'
    endif

    let l:data =
                \ '"{'
                \ .'\"text\":\"'.g:noachat#UserName.': leave\"'
                \ .'}"'

    let l:sendCmd = 'curl '.g:noachat#SendReqURL.'/send '
                \ .'-X POST -H "Content-Type: application/json" '
                \ .'-d '.l:data

    call system(l:sendCmd)
endfunction
