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

mkdir "\\%1\c$\Installss"

echo Copying Files for Local Installs.... Please Wait...

Xcopy  /y NET "\\%1\c$\Installss" /f /j /s /z


Echo Installing...

psexec \\%1 cmd /c C:\Installss\Install_.NET_Framework_3.5.cmd

if %ERRORLEVEL% EQU 0 echo.%1 >>success.txt
if %ERRORLEVEL% NEQ 0 echo.%1 >>Error.txt



Echo Done




Goto END



:END

