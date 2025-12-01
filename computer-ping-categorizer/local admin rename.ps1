# Author: Wk19-hub
$testcomputers = Get-Content "C:\Change local user\servers.txt"
foreach ($computer in $testcomputers) {
  if (Test-Connection -ComputerName $computer -Quiet -count 2){
      write-host "Pinging $computer"
    Add-Content -value $computer -path "C:\Change local user\livePCs.txt"
  }else{
    Add-Content -value $computer -path "C:\Change local user\deadPCs.txt"
  }
}


$computer = Get-Content "C:\install script\livePCs.txt"

#Param ([Parameter(Mandatory=$true)]

#[System.String[]]$Computer)
ForEach ($comp in $computer ) {
    Start-Process -Filepath "C:\Change local user\Pstools\psexec.exe" -Argumentlist "\\$comp -h -d winrm.cmd quickconfig -q"
	Write-Host "Enabling WINRM Quickconfig" -ForegroundColor Green
	Write-Host "Waiting for 10 Seconds......." -ForegroundColor Yellow
	Start-Sleep -Seconds 10 -Verbose	
    Start-Process -Filepath "C:\Change local user\Pstools\psexec.exe" -Argumentlist "\\$comp -h -d powershell.exe enable-psremoting -force"
	Write-Host "Enabling PSRemoting" -ForegroundColor Green
    Start-Process -Filepath "C:\Change local user\Pstools\psexec.exe" -Argumentlist "\\$comp -h -d powershell.exe set-executionpolicy RemoteSigned -force"
	Write-Host "Enabling Execution Policy" -ForegroundColor Green	
    Test-Wsman -ComputerName $comp
}          

$PCs = Get-Content "c:\install script\livePCs.txt"



foreach ($PC in $PCs) {
 $session = New-PSSession -ComputerName $PC
Enter-PSSession -Session $session
Invoke-Command -Session $session -ScriptBlock { Set-Location C:\Windows\System32 }
Invoke-Command -Session $session -ScriptBlock { Set-Location HKCU:\Software\Microsoft\Windows\CurrentVersion\Search }
Invoke-Command -Session $session -ScriptBlock { New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"  -Name BingSearchEnabled -Value "0" -PropertyType "DWORD"  }
Write-Host "Add DWORD KEY  $PC " -ForegroundColor Green
Invoke-Command -Session $session -ScriptBlock { taskkill /IM "SearchUI.exe" /F }
Start-Sleep -Seconds 2 -Verbose
Invoke-Command -Session $session -ScriptBlock { Set-Location C:\Windows\System32 }

Invoke-Command -Session $session -ScriptBlock { Start-Service -Name WSearch }
Write-Host "Start Service WSearch " -ForegroundColor Green
Start-Sleep -Seconds 2 -Verbose

Invoke-Command -Session $session -ScriptBlock { restart-Service -Name WSearch }

Write-Host "Restart Service WSearch " -ForegroundColor Yellow

Invoke-Command -Session $session -ScriptBlock { taskkill /IM "SearchUI.exe" /F }

Exit-PSSession

}




