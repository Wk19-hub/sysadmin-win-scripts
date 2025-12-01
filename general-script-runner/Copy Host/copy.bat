rem Author: Wk19-hub

:::: Start Copy :::::
@echo off
for /F "tokens=*" %%1 in (pclist.txt) do (
    echo Copying files to %%1
    
    xcopy "c:\etc\*.*" "\\%%1\c$\\Windows\System32\drivers\etc" /e /c /f /h /g /y /r
    )
:::: End Copy ::::::
