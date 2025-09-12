using Progress.Profiler.MemoryProfiler.

block-level on error undo, throw.

define temp-table ttCustomer no-undo
    field CustNum as integer
    field Name    as character
    field Balance as decimal
    .

var character cLeak = "".
var integer iCount = 0.
var logical lLeak = false.
var datetime-tz dStart = now.
var handle thCustomer = temp-table ttCustomer:handle.

create widget-pool "Test Pool".

assign cLeak = dynamic-function("getParameter" in source-procedure, "DoLeak") when (dynamic-function("getParameter" in source-procedure, "DoLeak") gt "") eq true.
assign lLeak = can-do("1,true,yes", trim(cLeak)).

message substitute("Running Generator; Leak: &1", lLeak).

do iCount = 1 to 10:
    MemoryProfiler:TakeSnapshot(substitute("Pre &1", iCount)).

    // Populate the temp-table with data.
    run tableRead.p(iCount, lLeak, thCustomer).

    // Turn the temp-table into JSON data.
    run createJson.p(iCount, lLeak, thCustomer).

    // Add memptr.
    run addMemory.p(iCount, lLeak).

    MemoryProfiler:TakeSnapshot(substitute("Post &1", iCount)).
end.

MemoryProfiler:TakeSnapshot("Finished").

finally:
    if not lLeak then
        delete widget-pool "Test Pool".

    define variable cReportName as character no-undo.
    MemoryProfiler:GetOutputFileName(output cReportName).
    message substitute("Executed code in &1 seconds [&2]", interval(now, dStart, "seconds"), cReportName).

    return string(0). // Exit cleanly, such as when run via PCT.
end finally.
