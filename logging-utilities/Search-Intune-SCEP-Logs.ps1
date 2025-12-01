# Author: Wk19-hub
# Search-Intune-SCEP-Logs.ps1
# ============================================================
# Script: Search Intune & SCEP Logs for Certificate Enrollment
# Purpose: Recursively search logs for SCEP/NDES/Intune-related events
#          and highlight certificate requests
# ============================================================

# Path to the folder where your log files are stored
$LogFolder = "C:\Logs"

# Output file (timestamped)
$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$OutputFile = "$LogFolder\SCEP_Intune_Results_$Timestamp.txt"

# Clear previous output file if exists
if (Test-Path $OutputFile) { Remove-Item $OutputFile }

# Keywords to focus on certificate enrollment and Intune
$Keywords = @(
    "SCEP",
    "mscep", 
    "NDES",
    "certificate",
    "Intune",
    "HTTP",
    "0x87D",
    "enrollment",
    "trusted root"
)

# Function to write both to console and file
Function Write-Log {
    param(
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
    Add-Content -Path $OutputFile -Value $Message -Encoding UTF8
}

Write-Log "=============================================================" "Green"
Write-Log "SCEP & Intune Certificate Search Results" "Green" 
Write-Log "Generated: $(Get-Date)" "Green"
Write-Log "=============================================================" "Green"

# Important certificate-related keywords
$ImportantKeywords = @("certificate", "SCEP", "enrollment", "trusted root", "NDES")

# IP pattern for network analysis
$IpPattern = "\b10\.42\.\d{1,3}\.\d{1,3}\b"

Get-ChildItem -Path $LogFolder -Include *.log, *.txt -Recurse | ForEach-Object {
    $File = $_.FullName
   
    # Match important certificate-related lines
    $CertMatches = Select-String -Path $File -Pattern $ImportantKeywords -SimpleMatch | Where-Object { $_.Line.Length -lt 500 }
    $IpMatches = Select-String -Path $File -Pattern $IpPattern -AllMatches | Where-Object { $_.Line.Length -lt 500 }

    if ($CertMatches -or $IpMatches) {
        Write-Log "`n==== Matches found in: $File ====" "Cyan"

        if ($CertMatches) {
            Write-Log "`n-- Certificate / SCEP / Trusted Root Matches --" "Green"
            $CertMatches | ForEach-Object {
                Write-Log "$($_.LineNumber): $($_.Line.Trim())" "Yellow"
            }
        }

        if ($IpMatches) {
            Write-Log "`n-- IP Matches (10.42.*) --" "Green" 
            $IpMatches | ForEach-Object {
                $_.Matches | ForEach-Object {
                    Write-Log "$($_.Value) found on line $($_.LineNumber)" "Magenta"
                }
            }
        }
    }
}

Write-Log "`nFiltered search completed. Results saved to $OutputFile" "Cyan"