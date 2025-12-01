# Hosts File Updater

Batch script to update hosts files on remote computers.

## Description

Deploys updated hosts files to multiple remote computers for DNS override purposes.

## Usage

```batch
:: Single computer
Host_File.bat COMPUTERNAME

:: Multiple computers
1.bat
```

## Files

- `1.bat` - Batch runner
- `Host_File.bat` - Main update script
- `computers.txt` - Target computer list
- `hosts` - Source hosts file

## Requirements

- Windows OS
- Administrative privileges
- Network access to admin shares

## Author

Wk19-hub

## License

MIT
