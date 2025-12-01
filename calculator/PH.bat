rem Author: Wk19-hub
@echo off
REM 
Echo ===================================================
Echo *     InStalling RIO !!!             *
if not %1. == . goto CHECKING
goto END

:CHECKING
@echo off
echo Checking PC %1

ping %1 -n 1 | find /i "ttl=" && Goto ONLINE

:OFFLINE
echo %1 is Offline
Echo %1 >> OfflineMachineshost.txt

Goto END

:ONLINE


echo Copying Calculator .... Please Wait...

xcopy SuthCalculator.exe "\\%1\c$\Users\Public\Desktop"  /h /s /z /y >NUL



Goto END



:END

