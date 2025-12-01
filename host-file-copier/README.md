# Host File Copier

Batch script to copy host files to remote computers.

## Description

Copies a customized hosts file to multiple remote computers, useful for DNS overrides or internal name resolution.

## Usage

```batch
:: Run the copy script
copy.bat
```

## Files

- `copy.bat` - Main copy script
- `pclist.txt` - List of target computers
- `hosts` - The hosts file to copy (place in source location)

## Target Location

Files are copied to:
```
\\COMPUTER\C$\Windows\System32\drivers\etc\hosts
```

## Requirements

- Windows OS
- Administrative privileges
- Network access to admin shares

## Warning

⚠️ Modifying hosts files can affect network connectivity. Test thoroughly.

## Author

Wk19-hub

## License

MIT
