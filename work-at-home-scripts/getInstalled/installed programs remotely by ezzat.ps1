# Author: Wk19-hub
Get-Content -Path C:\userx\getInstalled\computers.txt | ForEach-Object {Get-WmiObject -Namespace ROOT\CIMV2 -Class Win32_Product -Computer $_} | where{$_.Name -like "RSA*"} | Sort-Object Name | Export-CSV "C:\userx\getInstalled\file.csv" -Append -NoTypeInformation
