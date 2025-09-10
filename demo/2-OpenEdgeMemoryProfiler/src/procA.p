block-level on error undo, throw.

var integer ix = 0.

message "In A".

repeat ix = 1 to 5:
    run procH.p persistent.
end.

run procB.p.
