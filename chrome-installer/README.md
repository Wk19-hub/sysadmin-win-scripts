# Chrome Installer

Batch script for remote deployment of Google Chrome browser.

## Description

Remotely installs Google Chrome on multiple computers using batch scripts and PsExec.

## Usage

```batch
:: Run batch installer
1.bat
```

## Files

- `1.bat` - Batch runner for multiple computers
- `Chromee.bat` - Main installation script
- `computers.txt` - List of target computers
- `success.txt` - Log of successful installations
- `Error.txt` - Log of failed installations

## Requirements

- Windows OS
- PsExec (PsTools)
- Chrome installer package
- Administrative privileges

## Author

Wk19-hub

## License

MIT
