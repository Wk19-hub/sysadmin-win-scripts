# Author: Wk19-hub
# Find-SCEP-Errors.ps1
# PowerShell Script — Find SCEP or error entries in all logs

# Path to the folder where your log files are stored
$LogFolder = "C:\Logs"

# Define keywords to search for
$Keywords = @("SCEP", "mscep", ".dll", "error", "fail", "certificate", "NDES", "HTTP", "0x87D")

# Search recursively in all log/txt files
Get-ChildItem -Path $LogFolder -Include *.log, *.txt -Recurse | ForEach-Object {
    $File = $_.FullName
    $Matches = Select-String -Path $File -Pattern $Keywords -SimpleMatch
    if ($Matches) {
        Write-Host "`n==== Found matches in: $File ====" -ForegroundColor Cyan
        $Matches | ForEach-Object {
            # Show a small excerpt for each match
            Write-Host "$($_.LineNumber): $($_.Line.Trim())" -ForegroundColor Yellow
        }
    }
}