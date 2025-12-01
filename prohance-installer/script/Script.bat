rem Author: Wk19-hub
@echo Off


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

copy ProHanceSetup.msi "\\%1\c$\Installs" >NUL
)


( 



psexec -s \\%1 msiexec /i "\\%1\c$\ProHanceSetup.msi" /quiet TARGETDIR="%PROGRAMFILES%\ProHance Mate" HOST="server.company.com" PORT="8443" USEHTTPS="true" STEALTHMODE="1" ORGCODE="GENERIC") 
Echo Installing   



if %ERRORLEVEL% EQU 0 echo.%1 >>success.txt
if %ERRORLEVEL% NEQ 0 echo.%1 >>Error.txt



echo Script by Wk19-hub

Goto END



