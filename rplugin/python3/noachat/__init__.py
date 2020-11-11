import pynvim
import websocket

@pynvim.plugin
class NoaChat(object):
    def __init__(self, nvim):
        websocket.enableTrace(True)
        self.nvim = nvim

    def __del__(self):
        self.ws.close()

    @pynvim.function('NoachatCreateconn', sync=True)
    def noachat_create_conn(self, args):
        self.ws = websocket.create_connection("{}".format(args[0]))

    @pynvim.function('NoachatWsrecv', sync=False)
    def noachat_ws_recv(self, args):
        while self.nvim.eval('g:noachat#ws'):
            self.nvim.vars['g:noachat#ws'] = \
                self.nvim.call('noachat#isNoachat')

            result = self.ws.recv()
            self.nvim.call('noachat#insertText', result)

    @pynvim.function('NoachatClose', sync=False)
    def noachat_ws_close(self, args):
        self.ws.close()
