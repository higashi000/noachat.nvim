import pynvim
import websocket

@pynvim.plugin
class NoaChat(object):
    def __init__(self, nvim):
        websocket.enableTrace(True)
        self.nvim = nvim

    def __del__(self):
        self.ws.close()

    @pynvim.function('noachat#createconn', sync = True)
    def noachat_create_conn(self, args):
        self.ws = websocket.create_connection("{}".args[0])

    @pynvim.function('noachat#wsrecv', sync = False)
    def noachat_ws_recv(self, args):
        while True:
            result = self.ws.recv()
            self.nvim.command('echo "{}"'.result)
