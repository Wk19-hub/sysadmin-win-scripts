# Author: Wk19-hub
$servers = Get-Content C:\\Users\\anonymous\Desktop\Varient\remoteRegedit\servers.txt

$HostedRegFile = "C:\\Users\\anonymous\Desktop\Varient\remoteRegedit\s.reg"

$newfile = "\\$server\c$\Downloads\RegistryFiles\s.reg"

foreach ($server in $servers)

{

Copy-Item $HostedRegFile -Destination $newfile

Invoke-Command -ComputerName $server -ScriptBlock {

Start-Process -filepath "C:\windows\regedit.exe" -argumentlist "/s C:\Downloads\RegistryFiles\s.reg"

}

}
