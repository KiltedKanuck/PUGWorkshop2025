/* *************************************************
   mainproc.p
   
   Purpose: 
   Main orchestrator program for OpenTelemetry tracing demonstration
   in the PUG Workshop 2025. Creates a complex call hierarchy to 
   demonstrate distributed tracing capabilities.
   
   Description:
   This program serves as the entry point for an OpenTelemetry demonstration
   that creates a multi-level call hierarchy with random execution patterns.
   The program structure creates traces that can be visualized in APM tools
   like Jaeger to show:
   - Call relationships and dependencies
   - Execution timing and performance
   - Distributed trace spans across procedure calls
   - Random execution patterns for realistic scenarios
   
   Call Hierarchy:
   mainproc.p (this file)
   ├── proc1.p through proc5.p (randomly selected)
   │   ├── subprocA.p through subprocE.p (conditionally called)
   │   │   └── subsubprocA.p through subsubprocE.p (conditionally called)
   
   Each level introduces:
   - Random pause times (1-5 seconds) to simulate processing
   - Conditional execution (50% chance) to create varied call patterns
   - Message output showing the current procedure name
   
   Author: Cameron David Wright
   Email: cameron.wright@progress.com
   Company: Progress Software Corporation
   Title: Customer Solutions Architect
   
   Created: September 2025
   Modified: September 2025
   
   Parameters: None
   
   Usage:
   Interactive Mode:
   pro -otelconfig otelconfig.json -profile prof.cfg -p mainproc.p
   
   Batch Mode:
   bpro -otelconfig otelconfig.json -profile prof.cfg -p mainproc.p
   
   Notes:
   - Designed to work with OpenTelemetry configuration (otelconfig.json)
   - Creates X random procedure calls for comprehensive trace data
   - Each execution creates different trace patterns due to randomization
   - Pause statements simulate real-world processing delays
   - Use with Jaeger or other APM tools to visualize traces
   
   Related Files:
   - otelconfig.json: OpenTelemetry configuration
   - prof.cfg: CPU profiler configuration
   - proc1.p - proc5.p: Level 1 procedures
   - subprocA.p - subprocE.p: Level 2 procedures  
   - subsubprocA.p - subsubprocE.p: Level 3 procedures
   
**************************************************** */

/* Variable declarations */
var int procNumber = 0,     // Random procedure number (1-5)
        looper = 0,         // Loop counter
        loops = 5.         // Total number of procedure calls to make

/* ===================================================================
   MAIN PROGRAM LOGIC
   
   Executes 25 random procedure calls to create varied trace patterns.
   Each iteration randomly selects one of five procedures (proc1-proc5)
   to execute, creating different call hierarchies for OpenTelemetry
   tracing demonstration.
=================================================================== */
do looper = 1 to loops:
    /* Generate random procedure number (1-5) */
    procNumber = random(1, 5).
    
    /* Dynamically execute the selected procedure */
    run value("proc" + string(procNumber) + ".p").
end.

/* Terminate the session cleanly */
if session:client-type = "4GLCLIENT" then
    quit.
