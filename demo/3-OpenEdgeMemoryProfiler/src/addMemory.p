/* *************************************************
   testme.p
   Purpose: Demonstrates memory allocation and release in a loop for OpenTelemetry demo.
   - Allocates a random amount of memory in each iteration.
   - Occasionally releases the allocated memory.
   - Pauses between iterations to simulate workload.
**************************************************** */
block-level on error undo, throw.

define input parameter piCount      as integer no-undo.
define input parameter plLeak       as logical no-undo.

using Progress.Profiler.MemoryProfiler.

define variable i as integer no-undo.

do i = 1 to 20:
   run add_memory.
end.

/**
 * procedure add_memory
 * Allocates a random block of memory (1MB-2MB) and sometimes releases it.
 */
procedure add_memory:
   /* memptr is a pointer to a memory block allocated at runtime */
   define variable memptr as memptr no-undo.

   /* Allocate a random size between 1MB and 2MB */
   set-size(memptr) = random(1000000, 2000000).

   if not plLeak then
      set-size(memptr) = 0.
end.
