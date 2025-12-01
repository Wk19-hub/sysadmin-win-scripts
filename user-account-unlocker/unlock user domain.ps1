# Author: Wk19-hub
  Search-ADAccount -SearchBase "OU=Users,OU=COMPUTERX,OU=LOCATION,DC=example,DC=company,DC=com" -LockedOut | select DisplayName, EmailAddress, Title, DistinguishedName,Samaccountname | Export-CSV "C:\\temp\Email_Addresses1.csv" | Unlock-ADAccount 
 
 
 
Import-Module ActiveDirectory
Import-Csv "C:\\temp\Email_Addresses1.csv" | ForEach-Object {
 $samAccountName = $_."samAccountName" 
Get-ADUser -Identity $samAccountName | Unlock-ADAccount
Write-Host "-User "$samAccountName" unlocked"
} 
