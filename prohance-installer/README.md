# ProHance Installer

Batch scripts for remote deployment of ProHance monitoring software.

## Description

Deploys ProHance Mate to multiple computers using MSI installation with custom parameters.

## Usage

```batch
:: Single computer
script\Script.bat COMPUTERNAME

:: Multiple computers
1.bat
```

## Configuration

Edit `Script.bat` to customize:
- `HOST` - ProHance server address
- `PORT` - Server port
- `ORGCODE` - Organization code
- `STEALTHMODE` - Stealth mode setting

## Files

- `1.bat` - Batch runner
- `script/Script.bat` - Main installation script
- `script/computers.txt` - Target computer list
- `ProHanceSetup.msi` - Installation package (add your own)
- `success.txt` - Installation successes
- `Error.txt` - Installation failures

## Requirements

- Windows OS
- PsExec (PsTools)
- ProHance MSI package
- Administrative privileges

## Author

Wk19-hub

## License

MIT
