/* *************************************************
   connectDb.p
   Purpose: Connect to Sports2020 database for memory profiler demo
   Usage: Run this before running addMemory.p
**************************************************** */

block-level on error undo, throw.

define variable cDbPath as character no-undo.
define variable lConnected as logical no-undo.

/* Check if database is already connected */
lConnected = connected("Sports2020").

if not lConnected then do:
    /* Try to connect to local Sports2020 database */
    cDbPath = search("Sports2020.db").
    
    if cDbPath = ? then do:
        /* Try standard OpenEdge installation path */
        file-info:file-name = session:parameter + "/Sports2020.db".
        if file-info:full-pathname <> ? then
            cDbPath = file-info:full-pathname.
        else do:
            /* Try DLC path */
            file-info:file-name = os-getenv("DLC") + "/Sports2020.db".
            if file-info:full-pathname <> ? then
                cDbPath = file-info:full-pathname.
        end.
    end.
    
    if cDbPath <> ? then do:
        connect value(cDbPath) -1.
        message "Connected to Sports2020 database at:" cDbPath.
    end.
    else do:
        message "Sports2020 database not found. Please run 'proant generate' first or ensure Sports2020.db is in the current directory.".
        return.
    end.
end.
else
    message "Sports2020 database already connected.".
