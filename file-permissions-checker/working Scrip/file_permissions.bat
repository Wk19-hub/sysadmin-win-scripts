rem Author: Wk19-hub
@echo off
REM usage:
REM 

Echo -------------------- >> Results.txt
del RetryList.txt
for /f %%i in (computers.txt) do echo Currently Working on %%i & CALL :CHECKING %%i
pause
goto END

if not %1. == . goto CHECKING
goto END

:CHECKING
@echo on

ping %1 -n 1 | find /i "ttl=" && Goto ONLINE

:OFFLINE
Echo %1 - Offline >> Results.txt
Echo %1 >> RetryList.txt

Goto END

:ONLINE

xcopy /I /Y /E "%~dp0\files\*.*" "\\%1\C$"
psexec \\%1 -u .\administrator -p "eoseR=mid34" "C:\setacl.exe" -on C:\CaptureService\ -ot file -actn rstchldrn -rst dacl,sacl -silent
Echo %1 - Online >> Results.txt
IF %ERRORLEVEL% NEQ 0 (
  Echo %1 - Error %ERRORLEVEL% >> Error.txt
)

Goto END

:END

