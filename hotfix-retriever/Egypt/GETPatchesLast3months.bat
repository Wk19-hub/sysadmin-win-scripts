rem Author: Wk19-hub
@echo off
powershell -Command "& {get-hotfix | Where-Object {$_.installedon -gt (get-date).addmonths(-3)} | Sort-Object -property installedOn -Descending |Export-csv C:\Patchlist.csv -NoTypeInformation}
cmd.exe /c copy C:\Patchlist.csv \\Petar\getpatch\%computername%_Patch.csv
exit
