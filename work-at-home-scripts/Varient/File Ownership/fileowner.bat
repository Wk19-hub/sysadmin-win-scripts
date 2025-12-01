rem Author: Wk19-hub
@echo off
REM usage: 
REM 

if not %1. == . goto CHECKING
goto END

:CHECKING
@echo on

ping %1 -n 1 | find /i "ttl=" && Goto ONLINE

:OFFLINE

Echo %1 >> OfflineMachines.txt

Goto END

:ONLINE

takeown /s %1 /f \\%1\c$\CaptureService /r /d Y 

taskkill /s %1 /IM WCapWListener.exe

rmdir /s /q "\\%1\c$\CaptureService"

if %ERRORLEVEL% EQU 0 echo.%1 >>success.txt
if %ERRORLEVEL% NEQ 0 echo.%1 >>Error.txt

pause
Goto END

:END
