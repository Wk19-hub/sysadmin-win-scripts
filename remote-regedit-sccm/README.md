# Remote Regedit SCCM

Batch scripts to modify registry settings on remote computers for SCCM management.

## Description

Remotely applies registry modifications related to SCCM client configuration.

## Usage

```batch
:: Single computer
script.bat COMPUTERNAME

:: Multiple computers
1.bat
```

## Files

- `1.bat` - Batch runner
- `script.bat` - Main registry modification script
- `computers.txt` - Target computers

## Requirements

- Windows OS
- PsExec (PsTools)
- Administrative privileges

## Warning

⚠️ Modifying the registry can cause system instability. Backup before changes.

## Author

Wk19-hub

## License

MIT
