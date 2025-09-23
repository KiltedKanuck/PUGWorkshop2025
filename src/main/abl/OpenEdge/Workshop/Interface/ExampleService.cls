 
 /*------------------------------------------------------------------------
    File        : OpenEdge.Workshop.Interface.SampleService
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Cameron David Wright - cwright@progress.com
    Created     : Fri Sep 12 12:33:23 EDT 2025
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.

block-level on error undo, throw.

class OpenEdge.Workshop.Interface.ExampleService: 

    method public void mainProc(  ):

        run examples/mainproc.p .

    end method.

    method public void addMemory(  ):

      run examples/addMemory.p .

    end method.

    method public void callTree(  ):

      run examples/callTree.p .

    end method.

end class.