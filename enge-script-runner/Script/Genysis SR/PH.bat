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

mkdir "\\%1\c$\temp\ip\"

echo Copying Files for Local Installs.... Please Wait...

Xcopy C:\SilentInstall \\%1\c$\temp\ip\  /E /H /C /I

Echo Installing...

psexec \\%1  cmd /c \\%1\c$\temp\ip\setup.exe /s /z" -s 'c:\temp\ip\genesys_silent.ini' -sl 'c:\temp\ip\setup.log' -t 'c:\temp\ip\setup_wizard.log'"


if %ERRORLEVEL% EQU 0 echo.%1 >>success.txt
if %ERRORLEVEL% NEQ 0 echo.%1 >>Error.txt

Echo Done



Echo Copying Filee 




Goto END
Echo userx userx ( Development Team ) 

:END

