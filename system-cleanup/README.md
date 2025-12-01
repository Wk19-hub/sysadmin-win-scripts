# System Cleanup Script

Batch script to clean temporary files and caches on remote computers.

## Description

This script remotely deletes temporary files, SCCM cache, Windows temp files, and Software Distribution folder contents to free up disk space.

## Usage

Run with a computer name as parameter:
```batch
Cleanup.bat COMPUTERNAME
```

Or use with a batch runner:
```batch
for /f %%i in (computers.txt) do Cleanup.bat %%i
```

## What Gets Cleaned

- `C:\Apps\*.*` - Application temp files
- `C:\Windows\ccmcache\*.*` - SCCM cache
- `C:\Windows\Temp\*.*` - Windows temp folder
- `C:\Windows\SoftwareDistribution\*.*` - Windows Update cache

## Files

- `Cleanup.bat` - Main cleanup script
- `PCList.txt` - List of target computers (optional)
- `Run.bat` - Batch runner (optional)

## Requirements

- Windows OS
- Administrative privileges on target computers
- Network access to admin shares (C$)

## Warning

⚠️ This script permanently deletes files. Use with caution.

## Author

Wk19-hub

## License

MIT
