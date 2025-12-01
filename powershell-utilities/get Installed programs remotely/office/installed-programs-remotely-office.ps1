# Author: Wk19-hub
Get-Content -Path c:\computers.txt | ForEach-Object {Get-WmiObject -Namespace ROOT\CIMV2 -Class Win32_Product -Computer $_} | Where-Object {$_.Name -like "Microsoft Office Professional Plus*" -or $_.Name -like "Microsoft Office Standard 2013*" -or $_.Name -like "Microsoft Office 365 ProPlus*"} | Sort-Object Name | Export-CSV "c:\file.csv" -Append -NoTypeInformation
