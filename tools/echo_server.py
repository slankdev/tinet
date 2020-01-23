#!/usr/bin/env python3
import socket
import threading

def client_handler(conn,addr):
    msg = "you are {}:{}\n".format(addr[0],addr[1])
    conn.send(msg.encode("UTF-8"))
    while True:
        try:
            data = conn.recv(1024)
            conn.sendall(data)
        except socket.error:
            conn.close()
            print("close")
            break

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind(("0.0.0.0", 9999))
    s.listen(10)
    while True:
        conn, addr = s.accept()
        print("open and accept from {}:{}".format(addr[0], addr[1]))
        threading.Thread(target=client_handler, args=(conn,addr)).start()
