rem Author: Wk19-hub
@echo off
REM 

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

Echo CheckingPolicy...

psexec -s \\%1 "C:\Program Files\McAfee\Agent\cmdagent.exe" /c

Echo PolicyChecked...

Echo EnforcingPolicy...
psexec -s \\%1 "C:\Program Files\McAfee\Agent\cmdagent.exe" /e

Echo Enforced...


Echo SendingEvents...
psexec -s \\%1 "C:\Program Files\McAfee\Agent\cmdagent.exe" /f

if %ERRORLEVEL% EQU 0 echo.%1 >>success.txt
if %ERRORLEVEL% NEQ 0 echo.%1 >>Error.txt


Echo Done


Goto END



:END

