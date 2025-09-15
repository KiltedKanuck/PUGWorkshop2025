var int procNumber = 1, looper, loops = 5.

do looper = 1 to loops:
    procNumber = random(1, 5).
    run value("proc" + string(procNumber) + ".p").
end.

quit.
