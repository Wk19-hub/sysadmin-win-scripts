rem Author: Wk19-hub
@echo off
echo PLAN
echo.
Title=Plantronics App Installer
echo.

setlocal ENABLEEXTENSIONS
set notfound=notfound.txt
set failed=failed.txt
set success=success.txt
goto PCLIST

:PCLIST
set /p bp_PClist=  list:  
if /I [%bp_PClist%]==[] goto PCLIST
if not exist %bp_PClist% cls & echo File not found! & echo. & goto PCLIST
set bp_logfile=filepush_%bp_PClist%.log
set bp_off=filepush_NotFound_%bp_PClist%

for /F %%F in (%bp_PClist%) do echo %%F & call :CheckInstaller %%F
goto fin

:CheckInstaller
set pcname=%1
if %pcname% EQU exit pause && goto end
PING -n 1 -w 12 %pcname% | FIND "TTL=" >NUL
IF %ERRORLEVEL% EQU 1 goto noconnectivity
mkdir "\\%pcname%\c$\Installs"
echo Copying Files for Local Installs.... Please Wait....
copy /y "plan.exe" "\\%pcname%\c$\Installs" >NUL
psexec -s \\%pcname% "C:\Installs\plan.exe" 

goto end

:noconnectivity
echo.
echo.
echo %pcname% >> %notfound%
echo  -- %pcname% Not Found! --
echo.
echo.
goto end
  
:fin
set bp_pclist=
set bp_logfile=
set bp_off=
set pcname=
pause
:end


