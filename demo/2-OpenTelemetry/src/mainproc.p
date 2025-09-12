var int procNumber = 1, looper, loops = 5.

procNumber = random(1, 5).

do looper = 1 to loops:
    run value("proc" + string(procNumber) + ".p").
end.

quit.
