using Progress.Profiler.MemoryProfiler.

block-level on error undo, throw.

var datetime-tz dStart = now.

message "CallTree".

Progress.Profiler.MemoryProfiler:TakeSnapshot("Pre").

/**
  Calling Order:

  CallTree
    A
      H
      H
      H
      H
      H
      B
    B
    C
      J(1)
      J(2)
**/

run procA.p.

run procB.p.

if true then
    run procC.p.

Progress.Profiler.MemoryProfiler:TakeSnapshot("Post").

finally:
    define variable cReportName as character no-undo.
    MemoryProfiler:GetOutputFileName(output cReportName).
    message substitute("Executed code in &1 milliseconds [&2]", interval(now, dStart, "milliseconds"), cReportName).

    return string(0). // Exit cleanly, such as when run via PCT.
end finally.
