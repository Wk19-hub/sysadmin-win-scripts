# Author: Wk19-hub
# Search-Intune-WiFi-SCEP-Logs.ps1
# ============================================================
# Script: Search-IntuneWiFiSCEPLogs_Today.ps1
# Purpose: Detect Intune Wi-Fi profile and SCEP deployment failures
# ============================================================

$LogFolder   = "C:\Logs"
$Today       = (Get-Date).Date
$Timestamp   = (Get-Date).ToString("yyyyMMdd_HHmmss")
$OutputFile  = Join-Path $LogFolder "Intune_WiFi_SCEP_Check_$Timestamp.log"

if (Test-Path $OutputFile) { Remove-Item $OutputFile -Force }

# ============================================================
# Define keywords and failure indicators
# ============================================================

$ImportantKeywords = @(
    # Wi-Fi specific
    "wifi", "wi-fi", "wireless", "RADIUS",
    "network profile", "802.1x", "EAP", "authentication", "ssid", "connection failed",
    # Intune provisioning
    "Intune", "DeviceManagement", "MDM", "PolicyPlatform", "WLANProfile",
    # SCEP related
    "scep", "certificate enrollment", "certreq", "pkiclient.exe", "ndes", "mscep"
)

# ============================================================
# Function: Tag log lines for easier diagnosis
# ============================================================

function Add-TaggedLine {
    param ($Line)

    $Timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")

    switch -Regex ($Line) {
        "unreachable|timeout|ConnectFailure|SocketException|could not connect" { return "$Timestamp [NETWORK_FAIL] $Line" }
        "TLS|SSL|handshake|trust|schannel"                                    { return "$Timestamp [TLS_FAIL] $Line" }
        "TransactionException|MessageDecodingException|SCEP|pkiclient"        { return "$Timestamp [SCEP_FAIL] $Line" }
        "No connection could be made|refused|connection reset"                { return "$Timestamp [CONN_REFUSED] $Line" }
        "certificate|enrollment|CA|thumbprint"                                { return "$Timestamp [CERT_PROCESS] $Line" }
        "Intune|DeviceManagement|PolicyPlatform"                              { return "$Timestamp [INTUNE_AGENT] $Line" }
        "wifi|wi-fi|ssid|network|EAP|802.1x|authentication failed"            { return "$Timestamp [WIFI_PROFILE] $Line" }
        "success|completed|200 OK"                                            { return "$Timestamp [SUCCESS] $Line" }
        default                                                               { return "$Timestamp [LOG] $Line" }
    }
}

# ============================================================
# Scan and capture relevant entries
# ============================================================

Write-Host "=== Scanning today's logs in $LogFolder for Intune Wi-Fi and SCEP activity ===" -ForegroundColor Cyan

Get-ChildItem -Path $LogFolder -Include *.log, *.txt -Recurse |
    Where-Object { $_.LastWriteTime -ge $Today } |
    ForEach-Object {
        $File = $_.FullName
        Write-Host "Processing file: $File ..." -ForegroundColor Green

        Get-Content $File -ReadCount 1 | ForEach-Object {
            $Line = $_
            foreach ($Keyword in $ImportantKeywords) {
                if ($Line -match [regex]::Escape($Keyword)) {
                    Add-Content -Path $OutputFile -Value (Add-TaggedLine $Line)
                    break
                }
            }
        }
    }

Write-Host "`n=== Scan complete. Results saved to: $OutputFile ===" -ForegroundColor Cyan
Write-Host "Tip: Check for [WIFI_PROFILE] or [SCEP_FAIL] tags to identify deployment issues." -ForegroundColor Yellow