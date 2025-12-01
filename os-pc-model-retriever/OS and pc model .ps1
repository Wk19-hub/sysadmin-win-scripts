# Author: Wk19-hub
$servers = Get-Content "C:\install script\input pc.txt"

$List = @()

$results = foreach ($server in $servers) {
   Write-Host "Processing server $server"
$bios = Get-WmiObject Win32_BIOS -ComputerName $server
$Modelno = Get-WmiObject  Win32_ComputerSystem -ComputerName $server | select model
$Name = Get-WmiObject Win32_OperatingSystem -ComputerName $server | Select Name

$List += [pscustomobject]@{

    'ComputerName'        = $server
    'Manufacturer'        = $bios.Manufacturer
    'Model'               = $Modelno.model
    'Name'                = $Name.OS
    
 }
 }


$List | Export-Csv -Path 'C:\install script\output_name.csv'
