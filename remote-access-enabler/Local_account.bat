rem Author: Wk19-hub
cmd /c sc config Termservice start=auto

cmd /c  net start TermService 

cmd /c reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

GOTO END

:END



