# Author: Wk19-hub
cls
write-host -BackgroundColor Blue "##########################"
write-host "Welcome to IT Scripts " 

try {

$cred =$Host.ui.PromptForCredential("Domain Network credential are needed", "Please enter your Domain User Name and password 
            `n (example: domain\username)", "", "NetBiosUserName")


$mypcs =(Read-Host -Prompt "Please insert the computer names of the computers you want to retrieve the MAC Address, with comma separated
`n (you can combine IP's and pc's to: 192.168.x.x,pc-01 etc..)").split(',') | ForEach-Object {$_.trim()}



foreach ($pc in $mypcs) {


        Get-WmiObject -class Win32_NetworkAdapterConfiguration -ComputerName $pc -ErrorAction Stop |
        Where-Object IpEnabled -EQ "True" |
        Select-Object PSComputerName,MACAddress |
        Format-Table -AutoSize 
                           }

    }

catch {
write-host "`n"
Write-Warning  "Sorry, I can't reach to $pc, please check connectivity"

      }
write-host "`n"
Pause
