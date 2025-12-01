# Author: Wk19-hub
get-adgroupmember -identity "COMPUTERX managers - Modify Access" -recursive -server company.example.com | Export-Csv -Path c:\\temp\output.csv -NoTypeInformation
