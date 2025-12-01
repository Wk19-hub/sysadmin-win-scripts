# Author: Wk19-hub
# Reset-Intune-Management-Extension.ps1
# Complete reset of Intune Management Extension

Write-Host "=== Resetting Intune Management Extension ===" -ForegroundColor Cyan

Write-Host "Stopping Intune Management Extension service..." -ForegroundColor Yellow
Stop-Service IntuneManagementExtension

Write-Host "Removing all Intune Management Extension data..." -ForegroundColor Yellow
Remove-Item "C:\ProgramData\Microsoft\IntuneManagementExtension" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Starting Intune Management Extension service..." -ForegroundColor Yellow
Start-Service IntuneManagementExtension

Write-Host "Refreshing Primary Refresh Token..." -ForegroundColor Yellow
dsregcmd /refreshprt

Write-Host "Checking device registration status..." -ForegroundColor Cyan
dsregcmd /status

Write-Host "`nIntune Management Extension reset completed!" -ForegroundColor Green
Write-Host "The device will re-enroll and download policies automatically." -ForegroundColor Yellow