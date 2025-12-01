rem Author: Wk19-hub
net stop wuauserv 
net stop CcmExec

ren "C:\Windows\SoftwareDistribution"  SoftwareDistribution.old

net start wuauserv 
net start CcmExec
