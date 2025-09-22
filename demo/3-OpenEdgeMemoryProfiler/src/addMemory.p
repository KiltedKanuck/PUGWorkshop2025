/* *************************************************
   testme.p
   Purpose: Demonstrates memory allocation and release in a loop for OpenTelemetry demo.
   - Allocates a random amount of memory in each iteration.
   - Occasionally releases the allocated memory.
   - Pauses between iterations to simulate workload.
**************************************************** */
block-level on error undo, throw.

using Progress.Profiler.MemoryProfiler.

define input parameter piCount      as integer no-undo.
define input parameter plLeak       as logical no-undo.

var int64 randomCall = 0, i = 0 .

do i = 1 to 20:
    randomCall = random(1, 5).
    run value("add_memory" + string(randomCall)).
end.

/**
 * procedure add_memory
 * Allocates a random block of memory (1MB-2MB) and sometimes releases it.
 */
procedure add_memory1:
    /* memptr is a pointer to a memory block allocated at runtime */
    define variable memptr as memptr no-undo.

    /* Allocate a random size between 1MB and 2MB */
    set-size(memptr) = random(1000000, 2000000).

    if not plLeak then
        set-size(memptr) = 0.
end procedure.

procedure add_memory2:
   var handle hDoc, hRoot, hRow, hField, hText.
    create x-document hDoc.
    create x-noderef hRoot.
    create x-noderef hRow.
    create x-noderef hField.
    create x-noderef hText.

    if not plLeak then do:
        delete object hDoc no-error.
        delete object hRoot no-error.
        delete object hRow no-error.
        delete object hField no-error.
        delete object hText no-error.
    end.
end procedure.

procedure add_memory3:
    var handle hSaxWriter, hSaxReader.
    
    create sax-writer hSaxWriter.
    create sax-reader hSaxReader.

    if not plLeak then do:
        delete object hSaxWriter no-error.
        delete object hSaxReader no-error.
    end.
end procedure.

procedure add_memory4:
    var handle hQuery.
    define query OrderCust for Order, Customer.

    hQuery = query OrderCust:handle.
    hQuery:set-buffers(buffer Order:handle, buffer Customer:handle).
    hQuery:add-buffer(buffer SalesRep:handle).
    hQuery:query-open().
    
    if not plLeak then do:
        hQuery:query-close() no-error.
        delete object hQuery no-error.
    end.
end procedure.

procedure add_memory5:
   var handle hTT, hTTBuf, hQuery.
   var int64 iSeq = 0, iCNum = 0.
   var character cName = "", cRep = "".

    create temp-table hTT.
    hTT:create-like("Customer","Name").
    hTT:add-fields-from("SalesRep","MonthQuota").
    hTT:add-like-field("Area", "SalesRep.Region").
    hTT:add-new-field("Sequence", "INTEGER",0,"9999",1000).
    hTT:add-like-index("CustNum","CustNum","Customer").
    hTT:add-new-index("SeqIndex", yes).
    hTT:add-index-field("SeqIndex", "Sequence").
    
    hTT:temp-table-prepare("CustSequence").
    hTTBuf = hTT:default-buffer-handle.

    for each Customer where State = "NH", SalesRep of Customer:
        hTTBuf:buffer-create().
        hTTBuf:buffer-copy(buffer Customer:handle).
        hTTBuf:buffer-copy(buffer SalesRep:handle).
        hTTBuf:buffer-field("Sequence"):buffer-value = iSeq.
        iSeq = iSeq + 1.
    end.

    create query hQuery.
    hQuery:set-buffers(hTTBuf).
    hQuery:query-prepare("for each CustSequence").
    hQuery:query-open().
    hQuery:get-first().

    repeat while not hQuery:query-off-end:
        assign iSeq = hTTBuf:buffer-field("Sequence"):buffer-value
               cName = hTTBuf:buffer-field("Name"):buffer-value
               iCNum = hTTBuf:buffer-field("CustNum"):buffer-value
               cRep = hTTBuf:buffer-field("RepName"):buffer-value.
        hQuery:get-next().
    end.
    
    if not plLeak then do:
        hQuery:query-close() no-error.
        delete object hQuery no-error.
        delete object hTTBuf no-error.
        delete object hTT no-error.
    end.
end procedure.
