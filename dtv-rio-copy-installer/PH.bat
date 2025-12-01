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

psexec \\%1  cmd /c "del "\\%1\c$\Users\Public\Desktop\Rio*" 

mkdir "\\%1\c$\Installs"

echo Copying Files for Local Installs.... Please Wait...

copy DTV_IE8.msi "\\%1\c$\Installs" >NUL


Echo cInstalling...

psexec \\%1  cmd /c "msiexec.exe /i "\\%1\C$\Installs\DTV_ie8.msi" /q /qn /qb /norestart"

if %ERRORLEVEL% EQU 0 echo.%1 >>success.txt
if %ERRORLEVEL% NEQ 0 echo.%1 >>Error.txt

Echo Done



Echo Copying Filee 


xcopy RIO_Production.lnk "\\%1\c$\Users\Public\Desktop" /h /s /z /y >NUL



Goto END



:END

