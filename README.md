# noa-chat.nvim

## Description
Neovim chat plugin.<br>

## Requirements
- [websocket-client](https://github.com/websocket-client/websocket-client)
- [pynvim](https://github.com/neovim/pynvim)

this plugin is dedicated Neovim.<br>

## Install
nachat.nvim is require websocket-client and pynvim.<br>
Please install these library, from this command.<br>
```
pip install pynvim websocket-client
```

If you using dein.vim.<br>
```
call dein#add('higashi000/noachat.nvim')
```

If you using vim-plug.<br>
```
Plug 'higashi000/noachat.nvim'
```

## Usage
### Server
Install chat server to please execution this command.<br>
```
$ go get -u github.com/higashi000/noachat
```

After, passing PATH to $GOPATH/bin and run this command.<br>
```
$ noachat
```

If you will use official server.<br>
Don't install chat server.<br>

### Web Browser Client
Run chat server.<br>
After access to [localhost:5000](http://localhost:5000).<br>

If you will use official server, please access to [https://noa.higashi.dev](https://noa.higashi.dev)

### Neovim Client
#### Key map
Please write this key map in your vimrc.<br>
```
autocmd FileType noachat call s:noachat_settings()
function! s:noachat_settings() abort
    map <silent> ns <PLug>(noachat_start)
    map <silent> nl <Plug>(noachat_leave)
endfunction
```
This settings is example, and key map is freedom!<br>
Please choice your favorite key map.<br>

#### Connection Settings
If you will use official server, please write this settings in your vimrc.<br>
```
let g:noachat#ServerURL = 'noa.higashi.dev'
let g:noachat#https = v:true
```

If you will use local server, there is nothing to be.<br>

#### Connect and Start Chat
```
:StartNoaChat
```

#### Send Message
```
:NoaChatPostMsg
```

#### Leave Chat Room
Please Input key map, set to `<Plug>(noachat_leave)`.

#### Reconnect Chat Room
Please Input key map, set to `<Plug>(noachat_start)`.

## Pictures
![noachat picture](https://github.com/higashi000/noachat.nvim/blob/master/img/noachat.gif)
