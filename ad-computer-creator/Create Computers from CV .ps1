# Author: Wk19-hub

Import-Module ActiveDirectory
 
$CSV=‘C:\CsV.csv’										  #Path of CSv File to import from names 

$OU=‘OU=DEPARTMENT, OU=Computers,OU=COMPUTERX,OU=LOCATION,DC=example,DC=company,DC=com’  			  ## OU Path 

Import-Csv -Path $CSV | ForEach-Object { New-ADComputer -Name $_.Computer -Path $OU -Enabled $True} 
  



