# SCCM Troubleshooter

Batch scripts for troubleshooting SCCM client issues.

## Description

Collection of scripts to diagnose and fix common SCCM (System Center Configuration Manager) client problems:
- Client health checks
- Cache clearing
- Policy refresh
- Service restarts

## Usage

```batch
:: Run troubleshooting
1.bat
```

## Files

- `1.bat` - Batch runner
- `Local_account_Script.bat` - Main troubleshooting script
- `Local_account.bat` - Additional script
- `computers.txt` - Target computers

## Common Fixes Applied

- Restart SMS Agent Host service
- Clear CCMCache
- Force policy refresh
- Reset WMI repository (if needed)

## Requirements

- Windows OS
- PsExec (PsTools)
- Administrative privileges
- Network access to targets

## Author

Wk19-hub

## License

MIT
