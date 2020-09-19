if exists('g:loaded_noachat')
   finish
endif
let g:loaded_noachat = 1

let s:save_cpo = &cpo
set cpo&vim

let g:noachat#ServerURL = '://noa.higashi.dev'

function! noachat#Start() abort
   let l:connURL = 'wss'.g:noachat#ServerURL.'/ws'
   call NoachatCreateconn(l:connURL)
   call NoachatWsrecv()
endfunction

command! StartNoaChat call noachat#Start()
command! NoaChatPostMsg call noachat#sendMsg()

let &cpo = s:save_cpo
unlet s:save_cpo
