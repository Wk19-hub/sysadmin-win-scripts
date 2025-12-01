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

mkdir "\\%1\c$\Sec"

echo Copying Files for Local Installs.... Please Wait...

xcopy local-security-policy.inf "\\%1\c$\SEC" /s


Echo Installing...

psexec \\%1 secedit.exe /configure /db %windir%\security\local.sdb /cfg C:\SEC\local-security-policy.inf

if %ERRORLEVEL% EQU 0 echo.%1 >>success.txt
if %ERRORLEVEL% NEQ 0 echo.%1 >>Error.txt



Echo Done

rmdir /s /q "\\%1\c$\SEC"

Goto END



:END

