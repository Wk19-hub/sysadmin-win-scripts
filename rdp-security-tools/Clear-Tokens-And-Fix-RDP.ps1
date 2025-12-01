# Author: Wk19-hub
# Clear-Tokens-And-Fix-RDP.ps1
# Run as Administrator

$ErrorActionPreference = 'Stop'
$ts = Get-Date -Format 'yyyyMMdd_HHmmss'
$desktop = [Environment]::GetFolderPath('Desktop')
$backupDir = Join-Path $desktop "RDP_Fix_Backup_$ts"
New-Item -Path $backupDir -ItemType Directory -Force | Out-Null

Function Write-Log($s){ 
    Write-Host $s; 
    Add-Content -Path (Join-Path $backupDir 'actions.log') -Value ("$(Get-Date -Format o) $s") 
}

Write-Log "Started RDP/token cleanup and mitigation script."

# 1) Backup registry keys
$regKeys = @(
    'HKLM\SYSTEM\CurrentControlSet\Control\Lsa',
    'HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server',
    'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
    'HKLM\SOFTWARE\Microsoft\Terminal Server Client'
)

foreach ($k in $regKeys) {
    $file = Join-Path $backupDir ( ($k -replace '[:\\]','_') + '.reg' )
    try {
        reg export $k $file /y | Out-Null
        Write-Log "Exported ${k} to ${file}"
    } catch {
        Write-Log "Failed to export ${k}: $_"
    }
}

# 2) Clear TokenBroker cache
$tb = "$env:LOCALAPPDATA\Microsoft\TokenBroker"
if (Test-Path $tb) {
    Remove-Item "$tb\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Log "Cleared TokenBroker cache"
}

# 3) Clear WebAccountManager cache
$wam = "$env:LOCALAPPDATA\Microsoft\WebAccountManager"
if (Test-Path $wam) {
    Remove-Item "$wam\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Log "Cleared WebAccountManager cache"
}

# 4) Clear saved Windows credentials
Write-Host "`nListing saved Windows credentials..." -ForegroundColor Cyan
$creds = cmdkey /list
$lines = $creds -split "`n" | Where-Object { $_ -match 'Target:' }

foreach ($l in $lines) {
    $target = $l -replace '^\s*Target:','' -replace '\r','' -replace '\n','' -replace '^\s+',''
    $prompt = Read-Host "Delete credential entry '${target}'? (y/N)"
    if ($prompt -match '^[Yy]') {
        try {
            cmdkey /delete:$target | Out-Null
            Write-Log "Deleted credential: ${target}"
        } catch {
            Write-Log "Failed to delete ${target}: $_"
        }
    } else {
        Write-Log "Kept credential: ${target}"
    }
}

# 5) Purge Kerberos tickets
try {
    klist purge | Out-Null
    Write-Log "Purged Kerberos tickets"
} catch {
    Write-Log "Kerberos purge failed or not applicable"
}

# 6) Apply RDP registry mitigations
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "DisableRestrictedAdmin" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client" -Name "fClientDisableUDP" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "UseWDDMGraphicsDisplayDriver" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Terminal Server Client" -Name "DisableHardwareBitmapCache" -Value 1 -Type DWord -Force
Write-Log "Applied RDP registry mitigations"

# 7) Disable TCP offloads
netsh int tcp set global chimney=disabled | Out-Null
netsh int tcp set global autotuninglevel=disabled | Out-Null
netsh int tcp set global rss=disabled | Out-Null
Write-Log "Disabled TCP offloads"

# 8) Restart TermService
try {
    Restart-Service TermService -Force
    Write-Log "Restarted TermService"
} catch {
    Write-Log "Failed to restart TermService: $_"
}

# 9) Create rollback instructions
$rollbackFile = Join-Path $backupDir "ROLLBACK_INSTRUCTIONS.txt"
@"
To undo these changes:
- Import registry backups from $backupDir using reg import
- Delete these registry values:
  HKLM\SYSTEM\CurrentControlSet\Control\Lsa\DisableRestrictedAdmin
  HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client\fClientDisableUDP
  HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\UseWDDMGraphicsDisplayDriver
  HKLM\SOFTWARE\Microsoft\Terminal Server Client\DisableHardwareBitmapCache
- Re-enable TCP autotuning: netsh int tcp set global autotuninglevel=normal
"@ | Out-File $rollbackFile -Encoding UTF8
Write-Log "Created rollback instructions"

# 10) Offer reboot
Write-Host "`nAll changes applied. Reboot is recommended to finalize cleanup." -ForegroundColor Green
$reboot = Read-Host "Reboot now? (Y/N)"
if ($reboot -match '^[Yy]') {
    Write-Log "Rebooting now..."
    Restart-Computer -Force
} else {
    Write-Log "User chose not to reboot now"
    Write-Host "You can reboot later to complete the cleanup." -ForegroundColor Yellow
}