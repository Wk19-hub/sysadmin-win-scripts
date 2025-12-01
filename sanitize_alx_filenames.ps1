# Anonymize ALX* hostname patterns in CSV filenames
# Maps internal infrastructure hostnames to generic patterns

$renameMappings = @{
    # Physical desktops (DU location)
    'ALXDDUSTD'     = 'COMP_DU_'
    # VDI desktops (DU location)
    'ALXVDUSTD'     = 'VDI_DU_'
    # Bell location physical
    'ALXDBELSTD'    = 'COMP_BELL_'
    'ALXDBELODCC'   = 'COMP_BELL_ODCC_'
    'ALXDESBBM'     = 'COMP_BBM_'
    'ALXQA'         = 'COMP_QA_'
    # Bell VDI
    'ALXVBELSTD'    = 'VDI_BELL_'
    # SLB physical
    'ALX1SLB'       = 'COMP_SLB_'
    'ALXDES05'      = 'COMP_SLB_'
    # SLB VDI
    'ALXVSLBSTD'    = 'VDI_SLB_'
    # Department-specific
    'ALX1DES'       = 'COMP_DEPT_'
    'ALXDES'        = 'COMP_DEPT_'
    'ALX1DESFIN'    = 'COMP_FIN_'
    'ALX1DESISP'    = 'COMP_ISP_'
    'ALX1DESSUP'    = 'COMP_SUP_'
    'ALX1DESREC'    = 'COMP_REC_'
    'ALX1BELL'      = 'COMP_BELL_'
    'ALX1QA'        = 'COMP_QA_'
    'ALX1REC'       = 'COMP_REC_'
    'ALXTRN'        = 'COMP_TRN_'
    'ALX1TRN'       = 'COMP_TRN_'
    'ALX1DUTEMP'    = 'COMP_TEMP_'
}

# Track rename operations
$renameLog = @()
$errorLog = @()

Write-Host "Starting ALX* CSV filename anonymization..." -ForegroundColor Cyan
Write-Host "Working directory: $PWD" -ForegroundColor Gray

# Find all CSV files with ALX* patterns
$csvFiles = Get-ChildItem -Path . -Filter "*ALX*.csv" -Recurse -File

Write-Host "`nFound $($csvFiles.Count) files to process" -ForegroundColor Yellow

foreach ($file in $csvFiles) {
    $oldName = $file.Name
    $newName = $oldName
    
    # Apply all mapping patterns
    foreach ($pattern in $renameMappings.Keys) {
        if ($newName -match $pattern) {
            $newName = $newName -replace $pattern, $renameMappings[$pattern]
        }
    }
    
    # Only rename if name actually changed
    if ($newName -ne $oldName) {
        $newPath = Join-Path $file.DirectoryName $newName
        
        try {
            # Check if target already exists
            if (Test-Path $newPath) {
                $errorLog += [PSCustomObject]@{
                    OldPath = $file.FullName
                    NewPath = $newPath
                    Error = "Target file already exists"
                }
                Write-Host "  [SKIP] $oldName -> $newName (target exists)" -ForegroundColor Red
            } else {
                Rename-Item -Path $file.FullName -NewName $newName -ErrorAction Stop
                $renameLog += [PSCustomObject]@{
                    OldPath = $file.FullName
                    NewPath = $newPath
                    OldName = $oldName
                    NewName = $newName
                }
                Write-Host "  [OK] $oldName -> $newName" -ForegroundColor Green
            }
        } catch {
            $errorLog += [PSCustomObject]@{
                OldPath = $file.FullName
                NewPath = $newPath
                Error = $_.Exception.Message
            }
            Write-Host "  [ERROR] $oldName : $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

# Generate summary report
Write-Host "`n========== SANITIZATION SUMMARY ==========" -ForegroundColor Cyan
Write-Host "Total files processed: $($csvFiles.Count)" -ForegroundColor White
Write-Host "Successfully renamed: $($renameLog.Count)" -ForegroundColor Green
Write-Host "Errors/Skipped: $($errorLog.Count)" -ForegroundColor Red

# Export logs
$renameLog | Export-Csv -Path "rename_log.csv" -NoTypeInformation
$errorLog | Export-Csv -Path "error_log.csv" -NoTypeInformation

Write-Host "`nLogs saved:"
Write-Host "  - rename_log.csv (successful renames)" -ForegroundColor Gray
Write-Host "  - error_log.csv (errors and skips)" -ForegroundColor Gray

# Show preview of renames (first 20)
if ($renameLog.Count -gt 0) {
    Write-Host "`n========== RENAME PREVIEW (First 20) ==========" -ForegroundColor Cyan
    $renameLog | Select-Object -First 20 | ForEach-Object {
        Write-Host "  $($_.OldName) -> $($_.NewName)" -ForegroundColor Gray
    }
    
    if ($renameLog.Count -gt 20) {
        Write-Host "  ... and $($renameLog.Count - 20) more" -ForegroundColor DarkGray
    }
}

Write-Host "`nSanitization complete!" -ForegroundColor Green
