#!/usr/bin/env python3
import sys
from http.server import BaseHTTPRequestHandler
from http.server import HTTPServer
from http import HTTPStatus
port_range = { 'min':None, 'max':0 }

class StubHttpRequestHandler(BaseHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def log_request(self, code='-', size='-'):
        addr = str(self.client_address[0])
        port = int(self.client_address[1])
        if port_range['min'] is None:
            port_range['min'] = port
        port_range['min'] = min(port_range['min'], port)
        port_range['max'] = max(port_range['max'], port)
        print("{}:{} ( min={}, max={}, diff={} )".format(addr, port,
            port_range['min'], port_range['max'],
            port_range['max'] - port_range['min']))

    def do_GET(self):
        r = [ "{}:{}\n".format(self.client_address[0], self.client_address[1]) ]
        encoded = '\n'.join(r).encode(sys.getfilesystemencoding())
        self.send_response(HTTPStatus.OK)
        self.end_headers()
        self.wfile.write(encoded)

httpd = HTTPServer(('',80), StubHttpRequestHandler)
httpd.serve_forever()
