# Author: Wk19-hub
# Check-Secondary-Drive-Encryption.ps1
# Check if secondary drives are encrypted with BitLocker

# Get all fixed data drives except C:
$fixedDrives = Get-BitLockerVolume | Where-Object {
    $_.VolumeType -eq "Data" -and $_.MountPoint -ne "C:"
}

# Prepare result object
$result = @{}

# If no secondary fixed drives exist, treat as compliant
if ($fixedDrives.Count -eq 0) {
    $result["secondary_drives_encrypted"] = $true
} else {
    $allEncrypted = $true

    foreach ($drive in $fixedDrives) {
        $mp = $drive.MountPoint
        $isEncrypted = ($drive.VolumeStatus -eq "FullyEncrypted")

        # Add per-drive result
        $result[$mp.TrimEnd(':')] = $isEncrypted

        if (-not $isEncrypted) {
            $allEncrypted = $false
        }
    }

    # Add combined result
    $result["secondary_drives_encrypted"] = $allEncrypted
}

# Output JSON for Intune
Write-Output ($result | ConvertTo-Json -Compress)