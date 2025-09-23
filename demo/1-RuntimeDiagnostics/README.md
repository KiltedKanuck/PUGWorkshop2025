# Runtime Diagnostics
## r-code usage statistics
Statistics-gathering mechanisms include these various startup parameters:
 * __Statistics ( -y )__ — Use this startup parameter to collect procedure access and usage statistics throughout the OpenEdge session. This parameter also sends a report of all startup parameters and their values to the output file.
 * __Statistics with CTRL-C ( -yc )__ — When you use this startup parameter, press CTRL-C rather than using the SHOW-STATS statement to control when to collect statistics during execution.
 * __Segment Statistics ( -yd )__ — Use this startup parameter to write segment statistics, such as the number of segments and their total size, to the output file.
 * __Statistics with Cross-reference__ ( -yx ) — Use this startup parameter to collect procedure call statistics

## Analyze code and queries
Use the ```XREF``` option of the ```COMPILE``` statement to analyze your code and queries
```
compile <<file-name>> -xref <<xref-filename>>
```

The XREF option of the COMPILE statement provides a variety of static data about an ABL procedure, including:

* Other procedures that are RUN
* Text strings that exist in the procedure
* Code pages, include files, and shared variables used
* Events published, subscribed, and unsubscribed to
* Database tables accessed
* Indexes used for a particular database query

## Generate a protrace file for a running program
You can force the creation of a protrace file, which contains stack traces and other information, for an OpenEdge process that is currently executing. OpenEdge automatically writes this file when a program terminates abnormally, but in some cases you might want to generate it while the program is running.

You use the script proGetStack.bat (Windows) or proGetStack (UNIX) for this purpose. To run the script, enter the following at a command prompt:
```
proGetStack process_ID
```

You will requires a debug-list file to cross refernce line numbers in from the prostack file.
```
compile <<file-name>> -debug-list <<list-filename>>
```

## VST Stats & ABL Class for Accessing
 * Use the [```Progress.Database.VSTTableId```](https://docs.progress.com/bundle/abl-reference/page/Progress.Database.VSTTableId-class.html) class to access VST temp-tables. This class provides a set of static properties. Each property helps in identifying the VST

## Temp-Table Stats & ABL Class for Accessing
 * Use the [```Progress.Database.TempTableinfo```](https://docs.progress.com/bundle/abl-reference/page/Progress.Database.TempTableInfo-class.html) class to archive temp-table data. It provides methods for getting the handle of a given temp-table VST and also for getting the information of the temp-table by position and by ID

 ## Enhanced logging features
  * [Log entry types](https://docs.progress.com/bundle/openedge-abl-troubleshoot-applications/page/Log-entry-types.html)
  * [Application level Logging](https://docs.progress.com/bundle/openedge-abl-troubleshoot-applications/page/Application-level-logging.html)