block-level on error undo, throw.

define input parameter piCount      as integer no-undo.
define input parameter plLeak       as logical no-undo.
define input parameter phttCustomer as handle  no-undo.

// Limit output via the query to limit total objects created in the recording.
var character cQueryString = "for each Customer where Customer.CustNum le 5000":u.
var handle hBuffer, hQuery, hTTBuffer = phttCustomer:default-buffer-handle.

create buffer hBuffer for table "Customer":u no-error.
create query hQuery.

hQuery:set-buffers(hBuffer).
hQuery:query-prepare(cQueryString).
hQuery:query-open.

if plLeak then
    pause 0.1 no-message.
else
    phttCustomer:empty-temp-table().

// Add a pause to extend the total recording time.
pause 2 no-message.

// Do everything dynamically to reference more object/handles.
hQuery:get-first().
do while not hQuery:query-off-end:
    do transaction:
        hTTBuffer:buffer-create().
        hTTBuffer:buffer-copy(hBuffer).
    end.

    hQuery:get-next().
end.

if plLeak then do:
    // Skipping deletion of objects results in a memory leak.
    pause 0.1 no-message. // Provide a suitable delay to substitute for the deletion of objects.
end.
else do:
    // If you don't want leaks, clean up after yourself!
    delete object hQuery  no-error.
    delete object hBuffer no-error.
end.
