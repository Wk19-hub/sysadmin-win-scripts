rem Author: Wk19-hub
@echo off
REM 


mkdir "\\%1\c$\Installs"

echo Copying Files for Local Installs.... Please Wait...

copy Verint.msi "\\%1\c$\Installs" >NUL

copy SCInstall.cmd "\\%1\c$\Installs" >NUL



Echo Installing...

psexec -s \\%1 "\\%1\c$\Installs\SCInstall.cmd"

if %ERRORLEVEL% EQU 0 echo.%1 >>success.txt
if %ERRORLEVEL% NEQ 0 echo.%1 >>Error.txt



Echo Done

rmdir /s /q "\\%1\c$\Installs"

pause

Goto END



:END

