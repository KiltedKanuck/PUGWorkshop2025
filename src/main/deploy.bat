@echo off
xcopy /E /I /Y /D "C:\workspace\PUGWorkshop2025\src\main\resources\oemp\*" "C:\servers\workshop\openedge\resources"
xcopy /E /I /Y /D "C:\workspace\PUGWorkshop2025\src\main\resources\oprof\*" "C:\servers\workshop\openedge\resources"
xcopy /E /I /Y /D "C:\workspace\PUGWorkshop2025\src\main\resources\otel\*" "C:\servers\workshop\openedge\resources"
xcopy /E /I /Y /D "C:\workspace\PUGWorkshop2025\src\main\resources\ablapps\*" "C:\servers\workshop\ablapps"
xcopy /E /I /Y /D "C:\workspace\PUGWorkshop2025\src\main\resources\adapters\*" "C:\servers\workshop\webapps\ROOT\WEB-INF\adapters"
xcopy /E /I /Y /D "C:\workspace\PUGWorkshop2025\src\main\abl\*" "C:\servers\workshop\openedge"