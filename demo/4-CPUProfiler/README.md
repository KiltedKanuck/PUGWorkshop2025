# CPU Profiler (-profile) 

## About 
https://docs.progress.com/bundle/openedge-startup-and-parameter-reference/page/Profiler-profile.html

The CPU Profiler is a performance profiling tool that measures the amount of CPU time used by an application. It can be used to identify performance bottlenecks and optimize the application.

* Note: Time on line does not show user wait time when the program is run interactively, but will include system wait time if executed in batch (batch / PASOE).
* Example: Interactive: Pause is not shown, wait-for is not shown however lock wait-for would be shown. PASOE: Pause , wait-for (event) and lock wait-for would be shown.

### Example
It can be turned on from the command line with the -profile <profiler.cfg>.

_Interactive_
```
pro -p test.p -profile prof.cfg
```
_Batch_
```
bpro -p test.p -profile prof.cfg
```

You can use the vscode plugin ProPeek to view the profile data. You can also use the view option from PDSOE. The choice is yours.



demo with and without -b

add source at the end to generate listing. this is key for time-on-line

https://docs.progress.com/bundle/pas-for-openedge-management/page/Use-Server-Side-ABL-Performance-Profiling.html



localhost:9811/pug/web/mainproc ---> ./pugworkshop/demo/2-opentelelmenty/src/mainproc.p

connect(localhost:9811:/pug/apsv)
run mainproc.p on appserver

/web/pug/workshop/mainproc

web = transport
pug = handler ROOT.handlers DOH data-object-handler
workshop = service workshop.map
mainproc = operation | GET -> workshop.interface.sampleService
    function getCameron.p