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
   
    
       copy /Y s.reg \\%1\c$\ 




echo Script by Wk19-hub 

Goto END




