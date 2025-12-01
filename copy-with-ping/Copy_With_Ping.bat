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

mkdir "\\%1\c$\Copied_Files"

echo Copying Files .... Please Wait...

xcopy put_Files_u_want_2_Copy_here "\\%1\c$\Copied_Files" /e /y /h /s >NUL



if %ERRORLEVEL% EQU 0 echo.%1 >>success.txt
if %ERRORLEVEL% NEQ 0 echo.%1 >>Error.txt



Echo Done Script by Wk19-hub 




Goto END



:END

