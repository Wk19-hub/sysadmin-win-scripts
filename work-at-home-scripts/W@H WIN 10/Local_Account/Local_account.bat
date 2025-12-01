rem Author: Wk19-hub
cmd /c net user localadmin password=2 /add

cmd /c WMIC USERACCOUNT WHERE Name='localadmin' SET PasswordExpires=FALSE

cmd /c net localgroup administrators localadmin /add

cmd /c net localgroup administrators "DOMAIN\\userx Team Members" /add

GOTO END

:END



