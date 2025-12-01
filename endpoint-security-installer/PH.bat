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

mkdir "\\%1\c$\ENS"

echo Copying Files for Local Installs.... Please Wait...

xcopy ENS "\\%1\c$\ENS" /s


Echo Installing...

psexec \\%1 cmd /c c:\ENS\run.bat 

if %ERRORLEVEL% EQU 0 echo.%1 >>success.txt
if %ERRORLEVEL% NEQ 0 echo.%1 >>Error.txt



Echo Done


Goto END



:END

