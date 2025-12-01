# Adobe Installer

Batch scripts for remote deployment of Adobe software.

## Description

Deploys Adobe Reader or other Adobe products to multiple computers using batch scripting.

## Usage

```batch
:: Run installer
1.bat
```

## Files

- `1.bat` - Batch runner
- `PH.bat` - Main installation script
- `computers.txt` - Target computers
- `adoberdr/` - Adobe installation files (add your own)
- `success.txt` - Successful installations
- `Error.txt` - Failed installations
- `OfflineMachineshost.txt` - Offline machines log

## Requirements

- Windows OS
- PsExec (PsTools)
- Adobe installer package
- Administrative privileges

## Author

Wk19-hub

## License

MIT
