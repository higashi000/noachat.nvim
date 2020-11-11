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
### Key map
Please write this key map in your vimrc.<br>
```
map nl <Plug>(noachat_leave)
map ns <Plug>(noachat_start)
```
This settings is example, and key map is freedom!<br>
Please choice your favorite key map.<br>

### Connect and Start Chat
```
:StartNoaChat
```

### Send Message
```
:NoaChatPostMsg
```

### Leave Chat Room
Please Input key map, set to `<Plug>(noachat_leave)`.

### Reconnect Chat Room
Please Input key map, set to `<Plug>(noachat_start)`.

## Pictures
![noachat picture](https://github.com/higashi000/noachat.nvim/blob/master/img/noachat.gif)
