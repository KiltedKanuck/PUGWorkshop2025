 
 /*------------------------------------------------------------------------
    File        : OpenEdge.Workshop.Interface.SampleService
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Cameron David Wright - cwright@progress.com
    Created     : Fri Sep 12 12:33:23 EDT 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS OpenEdge.Workshop.Interface.SampleService: 

    METHOD PUBLIC VOID RunSample(  ):

        run C:/workspace/PUGWorkshop2025/demo/2-OpenTelemetry/src/mainproc.p .
        

    END METHOD.

END CLASS.