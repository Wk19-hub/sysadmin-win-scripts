# Verint Screen Capture Updater

Scripts for deploying Verint screen capture client updates.

## Description

Collection of deployment scripts for Verint recording software including:
- Visual C++ prerequisites
- Screen capture client installation
- File ownership management
- Host file updates

## Subfolders

### Visual C++2015 Script File_Prerequisites/
Installs Visual C++ 2015 redistributable required by Verint.

### Verint_Installation_Script File/
Main Verint installation scripts.

### File Ownership/
Scripts to manage file ownership and permissions.

### Copy Host/
Scripts to copy required host file entries.

## Usage

```batch
:: Install prerequisites first
cd "Visual C++2015 Script File_Prerequisites"
1.bat

:: Then install Verint
cd "..\Verint_Installation_Script File"
1.bat
```

## Requirements

- Windows OS
- PsExec (PsTools)
- Verint installation packages (add your own)
- Administrative privileges

## Author

Wk19-hub

## License

MIT
