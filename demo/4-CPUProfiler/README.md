# CPU Profiler (-profile) 

## ABL profiler (ABL Performance Profiling)
https://docs.progress.com/bundle/openedge-startup-and-parameter-reference/page/Profiler-profile.html

The CPU Profiler is a performance profiling tool that measures the amount of CPU time used by an application. It can be used to identify performance bottlenecks and optimize the application.

* Note: Time on line does not show user wait time when the program is run interactively, but will include system wait time if executed in batch (batch / PASOE).
* Example: Interactive: Pause is not shown, wait-for is not shown however lock wait-for would be shown. PASOE: Pause , wait-for (event) and lock wait-for would be shown.

### Example
It can be turned on from the command line with the -profile <profiler.cfg>.

`cd src/main/abl/examples`

_Interactive_
```
pro -p mainproc.p -profile ../../resources/oprof/prof.cfg
```
_Batch_
```
bpro -p mainproc.p -profile ../../resources/oprof/prof.cfg
```

You can view performance data using the Profiler tool in Progress Developer Studio or ProPeek in Visual Studio Code The choice is yours.


add source at the end to generate listing. this is key for time-on-line

## PASOE profiler (Server-Side ABL Performance Profiling)

PAS for OpenEdge system administrators and developers can use Server-Side ABL Performance Profiling to gather and monitor run-time performance data about ABL applications running on a PAS for OpenEdge instance.

This link below explains how to configure a PAS for OpenEdge instance to use performance profiling, configure the diagnostic store application, and view performance data using the Profiler tool in Progress Developer Studio or ProPeek in Visual Studio Code.

[Server-Side ABL Performance Profiling](https://docs.progress.com/bundle/pas-for-openedge-management/page/Use-Server-Side-ABL-Performance-Profiling.html)

