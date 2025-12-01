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

mkdir "\\%1\c$\Installs"

echo Copying Files for Local Installs.... Please Wait...

copy Pro.msi "\\%1\c$\Installs" >NUL


Echo Installing...

psexec -s \\%1 msiexec /i "\\%1\c$\Installs\Pro.msi" /qb TARGETDIR="C:\Program Files\NetValence\ProHance Probe" HOST="10.x.x.x" PORT="4040" ORGCODE="GENERIC"

if %ERRORLEVEL% EQU 0 echo.%1 >>success.txt
if %ERRORLEVEL% NEQ 0 echo.%1 >>Error.txt



Echo Done

rmdir /s /q "\\%1\c$\Installs"


Goto END



:END

