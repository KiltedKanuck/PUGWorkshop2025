# Before we begin
All examples should be run inside of a Proenv. To activate a Proenv from VSCode or Windsurf open a terminal window. Choose launch profile "Proenv"

## OpenEdge 12.8.9
This version of OpenEdge is as follows:
- DLC = C:\OE128\DLC
- WRK = C:\OE128\WRK

## Visual Studio Code 
This project is located at `C:\workspace\PUGWorkshop2025`. I have installed the following plugins:
- OpenEdge ABL - Riverside & Prorgess
- ProPeek - Baltic Amadeus
- ABLUnit Test Runner - kherring
- vscode-pets - tonybaloney

## DATABASES `C:\databases`
### sports2020
Sports2020 Can be found `C:\databases\Sports2020`. We will use this database to run the examples. This database has an entry in OpenEdge Manager under database resources. It will autostart with your vm.
### oediagdb
This is the database for the diagnostic store application. IF you follow the instructions it will live under `c:\servers\diagstore\work\oediagdb`

## PASOE `C:\servers`
### Workshop
There is a local PASOE instance running named "workshop". It is running on port 9810 & 9811. It lives under `C:\servers\workshop`

### Diagnostic Store
The diagnostic store application should be installed under `C:\servers\workshop\oediagstore`. 