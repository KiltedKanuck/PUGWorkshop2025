
note: time on line does not show user wait time, but will include system wait time. Example pause is not shown, wiat-for lock would be shown.
this is when you are running in interactive mode, if you are running in batch (batch / PASOE) then the pause is counted.

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