# Author: Wk19-hub
# Intune-Compliance-Debug-Report.ps1
# Generate comprehensive Intune compliance debug report

# Search terms for compliance issues
$SearchTerms = @(
    "Compliance",
    "ComplianceStateMessage", 
    "Policy",
    "Non-Compliant",
    "Failed",
    "Error",
    "Exception",
    "Timeout",
    "BitLocker",
    "Encryption",
    "SecondaryDisk"
)

# Output file
$OutputFile = "$env:USERPROFILE\Desktop\Intune_Compliance_Debug_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"

# Log folder
$LogDir = "C:\ProgramData\Microsoft\IntuneManagementExtension\Logs"
if (-not (Test-Path $LogDir)) {
    Write-Host "Intune IME log directory not found." -ForegroundColor Red
    exit
}

# Timestamp extraction regex from IME logs
$TimestampRegex = 'time="([^"]+)"'

# Report buffer
$Report = @()
$Report += "============================================================="
$Report += "Intune Compliance Debug Report"
$Report += "Generated: $(Get-Date)"
$Report += "============================================================="
$Report += ""

# Load logs
$Logs = Get-ChildItem -Path $LogDir -Filter *.log

foreach ($log in $Logs) {
    Write-Host "Scanning: $($log.Name)" -ForegroundColor Yellow

    $Report += "-------------------------------------------"
    $Report += " LOG FILE: $($log.Name)"
    $Report += "-------------------------------------------"

    foreach ($term in $SearchTerms) {
        Write-Host "  → Searching for: $term"

        $Report += "  >> Searching for: '$term'"
        $Report += "  ---------------------------------------"

        # Grab matches
        $LogMatches = Select-String -Path $log.FullName -Pattern $term -SimpleMatch -ErrorAction SilentlyContinue

        if ($LogMatches) {
            foreach ($m in $LogMatches) {
                # Extract IME timestamp
                $TimeMatch = [regex]::Match($m.Line, $TimestampRegex)

                if ($TimeMatch.Success) {
                    $LogTime = $TimeMatch.Groups[1].Value
                } else {
                    $LogTime = "NoTimestamp"
                }

                $Report += "  Line $($m.LineNumber) [$LogTime]: $($m.Line.Trim())"
            }
        } else {
            $Report += "  No matches found."
        }

        $Report += ""
    }

    $Report += "`n"
}

# Save file
$Report -join "`r`n" | Out-File -FilePath $OutputFile -Encoding UTF8 -Force

Write-Host "`nReport generated:`n$OutputFile" -ForegroundColor Green
Write-Host "`n=== Done ===`n" -ForegroundColor Cyan