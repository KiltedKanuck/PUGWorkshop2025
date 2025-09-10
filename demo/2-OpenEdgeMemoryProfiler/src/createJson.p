using Progress.Json.ObjectModel.JsonArray.
using Progress.Json.ObjectModel.JsonObject.

block-level on error undo, throw.

define input parameter piCount      as integer no-undo.
define input parameter plLeak       as logical no-undo.
define input parameter phttCustomer as handle  no-undo.

var JsonArray oArray.
var JsonObject oObj, oData.

// Convert the temp-table into JSON so we can generate more objects.
oObj = new JsonObject().
oObj:Read(phttCustomer).
oArray = oObj:GetJsonArray("ttCustomer":u).
oData = oArray:GetJsonObject(piCount).

message piCount ":" string(oData:GetJsonText()).

if plLeak then do:
    // Skipping deletion of objects results in a memory leak.
    pause 0.1 no-message. // Provide a suitable delay to substitute for the deletion of objects.
end.
else do:
    // If you don't want leaks, clean up after yourself!
    delete object oObj   no-error.
    delete object oArray no-error.
    delete object oData  no-error.
end.
