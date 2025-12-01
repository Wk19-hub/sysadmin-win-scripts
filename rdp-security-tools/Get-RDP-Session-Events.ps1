# Author: Wk19-hub
# Get-RDP-Session-Events.ps1
# Get recent RDP session events from Windows Event Log

Write-Host "Getting recent RDP session events..." -ForegroundColor Cyan

Get-WinEvent -LogName "Microsoft-Windows-TerminalServices-LocalSessionManager/Operational" -MaxEvents 200 |
    Where-Object { $_.Id -in 24,25,39,40 } |
    Select-Object TimeCreated, Id, Message |
    Sort-Object TimeCreated -Descending |
    Select-Object -First 10 |
    Format-Table -AutoSize

Write-Host "`nEvent ID Reference:" -ForegroundColor Yellow
Write-Host "24: Session has been disconnected" -ForegroundColor White
Write-Host "25: Session reconnection has succeeded" -ForegroundColor White  
Write-Host "39: Session has been disconnected, reason code" -ForegroundColor White
Write-Host "40: Session has been disconnected, reason code" -ForegroundColor White