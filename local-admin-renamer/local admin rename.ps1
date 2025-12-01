# Author: Wk19-hub
<#
.SYNOPSIS
    Renames the local Administrator account on remote computers.
.DESCRIPTION
    This script pings a list of computers, enables PowerShell remoting, and renames the local Administrator account to a new name.
.PARAMETER NewAdminName
    The new name for the Administrator account. Default is "LocalAdmin".
.PARAMETER ServersFile
    Path to the file containing list of servers. Default is "servers.txt".
.PARAMETER LivePCsFile
    Path to the file to write live PCs. Default is "livePCs.txt".
.PARAMETER DeadPCsFile
    Path to the file to write dead PCs. Default is "deadPCs.txt".
.PARAMETER PstoolsPath
    Path to psexec.exe. Default is "Pstools\psexec.exe".
.EXAMPLE
    .\local admin rename.ps1 -NewAdminName "AdminUser"
.NOTES
    Author: Wk19-hub
    Requires: Administrative privileges, Pstools installed.
#>
param (
    [string]$NewAdminName = "LocalAdmin",
    [string]$ServersFile = "servers.txt",
    [string]$LivePCsFile = "livePCs.txt",
    [string]$DeadPCsFile = "deadPCs.txt",
    [string]$PstoolsPath = "Pstools\psexec.exe"
)

# Ping computers and separate live and dead
$testcomputers = Get-Content $ServersFile
foreach ($computer in $testcomputers) {
    if (Test-Connection -ComputerName $computer -Quiet -Count 2) {
        Write-Host "Pinging $computer - Online"
        Add-Content -Value $computer -Path $LivePCsFile
    } else {
        Write-Host "Pinging $computer - Offline"
        Add-Content -Value $computer -Path $DeadPCsFile
    }
}

# Enable WinRM and PSRemoting on live PCs
$computers = Get-Content $LivePCsFile
foreach ($comp in $computers) {
    try {
        Start-Process -FilePath $PstoolsPath -ArgumentList "\\$comp -h -d winrm.cmd quickconfig -q" -Wait
        Write-Host "Enabling WINRM Quickconfig on $comp" -ForegroundColor Green
        Start-Sleep -Seconds 10
        Start-Process -FilePath $PstoolsPath -ArgumentList "\\$comp -h -d powershell.exe enable-psremoting -force" -Wait
        Write-Host "Enabling PSRemoting on $comp" -ForegroundColor Green
        Start-Process -FilePath $PstoolsPath -ArgumentList "\\$comp -h -d powershell.exe set-executionpolicy RemoteSigned -force" -Wait
        Write-Host "Setting Execution Policy on $comp" -ForegroundColor Green
        Test-WSMan -ComputerName $comp
    } catch {
        Write-Host "Error enabling remoting on $comp : $_" -ForegroundColor Red
    }
}

# Rename Administrator account
foreach ($PC in $computers) {
    try {
        $session = New-PSSession -ComputerName $PC
        Write-Host "Changing Local User on $PC" -ForegroundColor Green
        Invoke-Command -Session $session -ScriptBlock {
            Rename-LocalUser -Name "Administrator" -NewName $using:NewAdminName
        }
        Remove-PSSession -Session $session
    } catch {
        Write-Host "Error renaming admin on $PC : $_" -ForegroundColor Red
    }
}




