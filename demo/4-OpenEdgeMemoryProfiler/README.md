# OpenEdge Memory Profile
[OpenEdge Memory Profiling](https://docs.progress.com/bundle/openedge-abl-troubleshoot-applications/page/Profile-memory.html)

## Enable Memory profiling in the AVM & PASOE
You specify a configuration file when invoking ```-profileMemory```:
```
-profileMemory config-file
```
To run our example (From ProEnv from the src directory):
```
cd C:\workspace\PUGWorkshop2025\demo\3-OpenEdgeMemoryProfiler\src
proant generate
```
Now lets run them as one program with the memory profiler enabled:
```
pro -pf mprofiler.pf -param "DoLeak=false" -p ObjectGen.p
pro -pf mprofiler.pf -param "DoLeak=true" -p ObjectGen.p
pro -pf mprofiler.pf -p CallTree.p
```

## OpenEdge Memory Profiler Tool

[OpenEdge Memory Profiling tool](https://docs.progress.com/bundle/openedge-memory-profiler-olh/page/Introduction-to-the-OpenEdge-Memory-Profiler-tool.html)
```
$DLC/servers/redist/oemp-12.8.9.zip
right-click to extract the zip
```
From a proenv session
```
cd $DLC/servers/redist/oemp-12.8.9/oemp/bin
oemp.[bat|sh]
oemp.[bat|sh] install <-- defaults> (3 mins approx)
oemp.[bat|sh] startup
```

the OEMP server has been installed 

[Local OpenEdge Memory Profiler UI](http://localhost:8880/)

