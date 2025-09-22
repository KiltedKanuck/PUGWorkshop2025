/* *************************************************
   addMemory.p
   
   Purpose: 
   Demonstrates various memory allocation patterns and memory leak scenarios
   for the PUG Workshop 2025 OpenEdge Memory Profiler demonstration.
   
   Description:
   This program creates different types of memory allocations to demonstrate
   memory profiling capabilities in OpenEdge. It includes examples of:
   - Raw memory allocation using MEMPTR
   - XML DOM object creation
   - SAX parser object creation  
   - Dynamic temp-table creation and population
   - Complex temp-table structures with queries
   
   The program randomly calls one of five memory allocation procedures
   to create varied memory usage patterns for profiling analysis.
   
   Author: Cameron David Wright
   Title: Customer Solutions Architect
   Email: cameron.wright@progress.com
   Company: Progress Software Corporation
   
   
   Created: September 2025
   Modified: September 2025
   
   Parameters:
   piCount - Integer: Number of iterations (currently unused)
   plLeak  - Logical: If TRUE, memory is not released (creates leaks)
                     If FALSE, memory is properly cleaned up
   
   Usage:
   run addMemory.p (input 20, input false).  // No memory leaks
   run addMemory.p (input 20, input true).   // Create memory leaks
   
   Notes:
   - Designed to work with OpenEdge Memory Profiler
   - Use -profileMemory startup parameter to enable profiling
   - Each procedure demonstrates different memory allocation patterns
   
**************************************************** */
block-level on error undo, throw.

using Progress.Profiler.MemoryProfiler.

define input parameter piCount      as integer no-undo. // Number of iterations
define input parameter plLeak       as logical no-undo. // If TRUE, memory is not released (creates leaks)

/* Variable declarations */
var int64 randomCall = 0, i = 0 .
var character procName = "".
var logical lTakeSnapshot = false.

/* ===================================================================
   MAIN PROGRAM LOGIC
   Randomly executes one of five memory allocation procedures X times
   to create varied memory usage patterns for profiling analysis.
   X is the value passed in for piCount
=================================================================== */

if lTakeSnapshot then MemoryProfiler:TakeSnapshot("Pre_addMemory").

do i = 1 to piCount:
    randomCall = random(1, 5).
    procName = "add_memory" + string(randomCall).
    if lTakeSnapshot then MemoryProfiler:TakeSnapshot(substitute("Pre_&1_&2", procName, i)).
    run value(procName).
end.

if lTakeSnapshot then MemoryProfiler:TakeSnapshot("Post_addMemory").

/* ===================================================================
   PROCEDURE: add_memory1
   
   Purpose: Demonstrates raw memory allocation using MEMPTR
   
   Description:
   Allocates a random block of memory between 1MB and 2MB using MEMPTR.
   This simulates applications that allocate large blocks of memory
   for data processing or caching.
   
   Memory Pattern: Raw memory allocation
   Typical Usage: Large data buffers, image processing, file I/O buffers
=================================================================== */
procedure add_memory1:
    /* memptr is a pointer to a memory block allocated at runtime */
    define variable memptr as memptr no-undo.

    /* Allocate a random size between 1MB and 2MB */
    set-size(memptr) = random(1000000, 2000000).

    if not plLeak then
        set-size(memptr) = 0.
end procedure.

/* ===================================================================
   PROCEDURE: add_memory2
   
   Purpose: Demonstrates XML DOM object creation and memory usage
   
   Description:
   Creates multiple XML DOM objects (X-DOCUMENT and X-NODEREF handles)
   to simulate XML processing applications. These objects consume
   memory for DOM tree structures.
   
   Memory Pattern: XML DOM object allocation
   Typical Usage: XML parsing, document processing, web services
=================================================================== */
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

/* ===================================================================
   PROCEDURE: add_memory3
   
   Purpose: Demonstrates SAX parser object creation and memory usage
   
   Description:
   Creates SAX (Simple API for XML) parser objects for streaming
   XML processing. SAX parsers are more memory-efficient than DOM
   but still consume memory for parser state and buffers.
   
   Memory Pattern: SAX parser object allocation
   Typical Usage: Streaming XML processing, large XML file parsing
=================================================================== */
procedure add_memory3:
    var handle hSaxWriter, hSaxReader.
    
    create sax-writer hSaxWriter.
    create sax-reader hSaxReader.

    if not plLeak then do:
        delete object hSaxWriter no-error.
        delete object hSaxReader no-error.
    end.
end procedure.

/* ===================================================================
   PROCEDURE: add_memory4
   
   Purpose: Demonstrates dynamic temporary table creation and population
   
   Description:
   Creates a dynamic temporary table with order-like structure and
   populates it with 100 sample records. This simulates applications
   that create temporary tables for data processing or reporting.
   
   Memory Pattern: Temporary table with moderate data volume
   Typical Usage: Data transformation, reporting, temporary storage
   
   Table Structure:
   - OrderId: INTEGER
   - CustomerName: CHARACTER(50)
   - OrderDate: DATE  
   - Amount: DECIMAL
=================================================================== */
procedure add_memory4:
    var handle hTempTable, hBuffer, hQuery.
    var int64 i = 0.
    
    /* Create a temporary table to simulate memory allocation */
    create temp-table hTempTable.
    hTempTable:add-new-field("OrderId", "INTEGER").
    hTempTable:add-new-field("CustomerName", "CHARACTER", 0, "x(50)").
    hTempTable:add-new-field("OrderDate", "DATE").
    hTempTable:add-new-field("Amount", "DECIMAL", 0, ">>>,>>9.99").
    hTempTable:temp-table-prepare("OrderData").
    
    hBuffer = hTempTable:default-buffer-handle.
    
    /* Populate with sample data to consume memory */
    do i = 1 to 100:
        hBuffer:buffer-create().
        hBuffer:buffer-field("OrderId"):buffer-value = i.
        hBuffer:buffer-field("CustomerName"):buffer-value = "Customer " + string(i).
        hBuffer:buffer-field("OrderDate"):buffer-value = today.
        hBuffer:buffer-field("Amount"):buffer-value = random(100, 5000).
    end.
    
    if not plLeak then do:
        delete object hBuffer no-error.
        delete object hTempTable no-error.
    end.
end procedure.

/* ===================================================================
   PROCEDURE: add_memory5
   
   Purpose: Demonstrates complex temporary table with indexes and queries
   
   Description:
   Creates a complex temporary table structure with multiple fields,
   indexes, and populates it with 500 records. Then creates and executes
   a query to iterate through all records. This simulates memory-intensive
   operations with large datasets and complex table structures.
   
   Memory Pattern: Large temporary table with indexes and query processing
   Typical Usage: Data analysis, complex reporting, large dataset processing
   
   Table Structure:
   - CustNum: INTEGER (Primary Index)
   - Name: CHARACTER(50)
   - MonthQuota: DECIMAL
   - Area: CHARACTER(20)
   - Sequence: INTEGER (Secondary Index)
   
   Performance Notes:
   - Creates 500 records (5x more than add_memory4)
   - Includes two indexes for faster access
   - Performs full table scan via query
=================================================================== */
procedure add_memory5:
   var handle hTT, hTTBuf, hQuery.
   var int64 iSeq = 0, iCNum = 0.
   var character cName = "", cRep = "".

    /* Create a complex temp-table structure to simulate memory allocation */
    create temp-table hTT.
    hTT:add-new-field("CustNum", "INTEGER").
    hTT:add-new-field("Name", "CHARACTER", 0, "x(50)").
    hTT:add-new-field("MonthQuota", "DECIMAL", 0, ">>>,>>9.99").
    hTT:add-new-field("Area", "CHARACTER", 0, "x(20)").
    hTT:add-new-field("Sequence", "INTEGER", 0, "9999", 1000).
    hTT:add-new-index("CustNum", yes).     /* Primary index */
    hTT:add-index-field("CustNum", "CustNum").
    hTT:add-new-index("SeqIndex", no).     /* Secondary index */
    hTT:add-index-field("SeqIndex", "Sequence").
    
    hTT:temp-table-prepare("CustSequence").
    hTTBuf = hTT:default-buffer-handle.

    /* Populate with sample data to consume memory (500 records) */
    do iSeq = 1 to 500:
        hTTBuf:buffer-create().
        hTTBuf:buffer-field("CustNum"):buffer-value = iSeq.
        hTTBuf:buffer-field("Name"):buffer-value = "Customer " + string(iSeq).
        hTTBuf:buffer-field("MonthQuota"):buffer-value = random(5000, 50000).
        hTTBuf:buffer-field("Area"):buffer-value = "Region " + string(random(1, 10)).
        hTTBuf:buffer-field("Sequence"):buffer-value = iSeq.
    end.

    /* Create and execute query to iterate through all records */
    create query hQuery.
    hQuery:set-buffers(hTTBuf).
    hQuery:query-prepare("for each CustSequence").
    hQuery:query-open().
    hQuery:get-first().

    /* Process all records to simulate real-world usage */
    repeat while not hQuery:query-off-end:
        assign iSeq = hTTBuf:buffer-field("Sequence"):buffer-value
               cName = hTTBuf:buffer-field("Name"):buffer-value
               iCNum = hTTBuf:buffer-field("CustNum"):buffer-value
               cRep = hTTBuf:buffer-field("Area"):buffer-value.
        hQuery:get-next().
    end.
    
    if not plLeak then do:
        hQuery:query-close() no-error.
        delete object hQuery no-error.
        delete object hTTBuf no-error.
        delete object hTT no-error.
    end.
end procedure.

/* ===================================================================
   END OF PROGRAM
   
   Summary of Memory Allocation Patterns:
   1. add_memory1: Raw MEMPTR allocation (1-2MB)
   2. add_memory2: XML DOM objects (5 handles)
   3. add_memory3: SAX parser objects (2 handles)
   4. add_memory4: Simple temp-table (100 records)
   5. add_memory5: Complex temp-table with indexes (500 records)
   
   Each pattern demonstrates different memory usage characteristics
   that can be analyzed using the OpenEdge Memory Profiler.
=================================================================== */
