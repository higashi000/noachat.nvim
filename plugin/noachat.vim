if exists('g:loaded_noachat')
    finish
endif
let g:loaded_noachat = 1

let s:save_cpo = &cpo
set cpo&vim

au BufRead,BufNewFile *.noachat setfiletype noachat

noremap <Plug>(noachat_leave) :<C-u>call noachat#leaveChat()<CR>
noremap <Plug>(noachat_start) :<C-u>call noachat#startChat()<CR>

if !exists('g:noachat#ServerURL')
    let g:noachat#ServerURL = 'localhost:5000'
endif

if !exists('g:noachat#https')
    let g:noachat#https = v:false
endif

let g:noachat#SendReqURL = g:noachat#https ? 'https://'.g:noachat#ServerURL : 'http://'.g:noachat#ServerURL
let g:noachat#WsURL = g:noachat#https ? 'wss://'.g:noachat#ServerURL : 'ws://'.g:noachat#ServerURL
let g:noachat#ws = v:false
let g:noachat#isConnect = v:false

function! noachat#Start() abort
    if g:noachat#isConnect
        echo 'already done connect to server'
        return
    endif
    let g:noachat#roomid = input('room id > ')
    let l:connURL = g:noachat#WsURL . '/channel/' . g:noachat#roomid . '/ws'
    call NoachatCreateconn(l:connURL)
    let g:noachat#isConnect = v:true
    call noachat#startChat()
    let g:noachat#ws = noachat#isNoachat()
endfunction

command! StartNoaChat call noachat#Start()
command! NoaChatPostMsg call noachat#sendMsg()

let &cpo = s:save_cpo
unlet s:save_cpo
