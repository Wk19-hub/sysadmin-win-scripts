# Author: Wk19-hub
$servers = Get-Content "C:\install script\servers.txt"

$List = @()

$results = foreach ($server in $servers) {
   Write-Host "Processing server $server"

$Modelno = Get-WmiObject  Win32_ComputerSystem -ComputerName $server | select model
$Name = Get-WmiObject Win32_OperatingSystem -ComputerName $server | Select Name
$ST = Get-WmiObject win32_SystemEnclosure -computername $server | select serialnumber

$List += [pscustomobject]@{

    'ComputerName'        = $server
    'Model'               = $Modelno.model
    'Service tag'         = $ST
 }
 }


$List | Export-Csv -Path 'C:\install script\aaaaaa.csv'
