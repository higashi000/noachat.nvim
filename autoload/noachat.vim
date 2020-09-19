function! noachat#insertText(text) abort
   let insertText = ['------------------------', '', a:text, '']
   call append(1, insertText)
endfunction

function! noachat#sendMsg() abort
   let l:text = input('Post Text :')

   let l:sendText = ''
   if !exists("g:noachat#UserName")
      let l:sendText = l:sendText.'noname: '.l:text
   else
      let l:sendText = l:sendText.g:noachat#UserName.': '.l:text
   endif

   let l:data =
   \ '"{'
      \ .'\"text\":\"'.l:sendText.'\"'
   \ .'}"'

   let l:sendCmd = 'curl https'.g:noachat#ServerURL.'/send '
      \ .'-X POST -H "Content-Type: application/json" '
      \ .'-d '.l:data

   call system(l:sendCmd)
endfunction
