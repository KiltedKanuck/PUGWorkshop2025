var int pauseTime = 0, subProcNumber = 0.

pauseTime = random(1, 5).
subProcNumber = random(1, 5).

message THIS-PROCEDURE:FILE-NAME.
pause pauseTime.

if random(0, 1) = 1 then
   run value("subproc" + chr(subProcNumber + 64) + ".p").