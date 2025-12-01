rem Author: Wk19-hub

@echo off
for /F "tokens=*" %%1 in (pclist.txt) do (
    echo Copying files to %%1
    
       xcopy "C:\\Users\\anonymous\Desktop\Mcafee_Agent\*.*" "\\%%1\c$\" /e /c /f /h /g /y /r 

)

