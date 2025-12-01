# Author: Wk19-hub
# Force-Intune-Policy-Refresh.ps1
# Enforce Intune policy refresh and clear cache

Write-Host "Stopping Intune Management Extension..." -ForegroundColor Yellow
Stop-Service IntuneManagementExtension

Write-Host "Removing cached policies and health scripts..." -ForegroundColor Yellow
Remove-Item "C:\ProgramData\Microsoft\IntuneManagementExtension\HealthScripts" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "C:\ProgramData\Microsoft\IntuneManagementExtension\Policies" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Starting Intune Management Extension..." -ForegroundColor Yellow
Start-Service IntuneManagementExtension

Write-Host "Getting Intune agent version..." -ForegroundColor Cyan
$agentPath = "C:\Program Files (x86)\Microsoft Intune Management Extension\Microsoft.Management.Services.IntuneWindowsAgent.exe"
if (Test-Path $agentPath) {
    $version = (Get-Item $agentPath).VersionInfo.ProductVersion
    Write-Host "Intune Agent Version: $version" -ForegroundColor Green
}

Write-Host "Refreshing Primary Refresh Token..." -ForegroundColor Yellow
dsregcmd /refreshprt

Write-Host "Checking Windows Update..." -ForegroundColor Yellow
Invoke-Command { (New-Object -ComObject Microsoft.Update.AutoUpdate).DetectNow() }

Write-Host "Checking device registration status..." -ForegroundColor Cyan
dsregcmd /status

Write-Host "`nIntune policy refresh completed!" -ForegroundColor Green