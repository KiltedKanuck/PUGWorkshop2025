/*------------------------------------------------------------------------
    File        : diagstore.p
    Purpose     : Extract profiler data from diagnostic store ProfiledRequest table
    Description : Iterates through ProfiledRequest records and exports performance 
                  data to individual .prof files for analysis
    Author(s)   : Cameron David Wright
    Created     : 2025-09-23
    Notes       : 
  ----------------------------------------------------------------------*/

/* Variable declarations using camelCase naming convention */
var integer requestId.
var character fileName, outputDir = "temp\", fileExtension = ".prof".

/* Ensure output directory exists */
file-info:file-name = outputDir.
if file-info:file-type = ? then do:
    message "Output directory does not exist: " + outputDir
        view-as alert-box error.
    return.
end.
else if file-info:file-type <> "DRW" then do:
    message "Output path is not a directory: " + outputDir
        view-as alert-box error.
    return.
end.

/* Process each ProfiledRequest record */
for each ProfiledRequest no-lock:
    
    /* Increment request counter */
    requestId = requestId + 1.
    
    /* Build output filename with zero-padded request ID */
    fileName = outputDir + "profiler_" + string(requestId, "999999") + fileExtension.
    
    /* Export performance data to file */
    copy-lob ProfiledRequest.PerfData to file fileName no-error.
    
    /* Handle any errors during file export */
    if error-status:error then do:
        message "Error exporting profiler data to file: " + fileName skip
                "Error: " + error-status:get-message(1)
            view-as alert-box error.
        next.
    end.
    
    /* Log successful export */
    message "Exported profiler data to: " + fileName
        view-as alert-box information.
        
end.

/* Summary message */
message "Processing complete. Exported " + string(requestId) + " profiler files to " + outputDir
    view-as alert-box information.
