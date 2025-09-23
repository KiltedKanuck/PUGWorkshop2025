var handle hServer.

create server hServer.
hServer:connect("-URL http://localhost:9810/apsv").

if not hServer:connected() then do:
    message "Could not connect to server".
    return.
end.

run callTree.p on hServer.

run mainProc.p on hServer.

run addMemory.p on hServer.

hServer:disconnect().

quit.

finally:
    delete object hServer no-error.
end.