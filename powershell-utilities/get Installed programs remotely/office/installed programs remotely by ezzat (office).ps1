# Author: Wk19-hub
Get-Content -Path c:\computers.txt | ForEach-Object {Get-WmiObject -Namespace ROOT\CIMV2 -Class Win32_Product -Computer $_} | where{$_.Name -like "Microsoft Office Professional Plus*" ,"Microsoft Office Standard 2013
*" , "Microsoft Office 365 ProPlus*"} | Sort-Object Name | Export-CSV "c:\file.csv" -Append -NoTypeInformation
