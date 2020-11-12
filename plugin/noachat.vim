if exists('g:loaded_noachat')
    finish
endif
let g:loaded_noachat = 1

let s:save_cpo = &cpo
set cpo&vim

au BufRead,BufNewFile *.noachat setfiletype noachat

noremap <Plug>(noachat_leave) :<C-u>call noachat#leaveChat()<CR>
noremap <Plug>(noachat_start) :<C-u>call NoachatWsrecv()<CR>

let g:noachat#ServerURL = '://localhost:5000'
let g:noachat#https = v:false
let g:noachat#SendReqURL = g:noachat#https ? 'https'.g:noachat#ServerURL : 'http'.g:noachat#ServerURL
let g:noachat#WsURL = g:noachat#https ? 'wss'.g:noachat#ServerURL : 'ws'.g:noachat#ServerURL
let g:noachat#ws = v:false
let g:noachat#UserName = ''

function! noachat#Start() abort
    let l:connURL = g:noachat#WsURL.'/ws'
    let g:noachat#ws = noachat#isNoachat()
    call NoachatCreateconn(l:connURL)
    call NoachatWsrecv()
endfunction

command! StartNoaChat call noachat#Start()
command! NoaChatPostMsg call noachat#sendMsg()

let &cpo = s:save_cpo
unlet s:save_cpo
