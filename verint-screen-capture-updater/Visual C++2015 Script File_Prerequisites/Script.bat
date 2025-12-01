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

echo Copying files 
   
    
       copy /Y plan.exe \\%1\c$\ 
)


( 



PSEXEC \\%1 -s  cmd /c  c:\plan.exe -i -d )
Echo Installing  

echo Script by Wk19-hub 

Goto END




