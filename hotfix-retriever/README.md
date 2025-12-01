# Hotfix Retriever

Batch and PowerShell scripts to retrieve installed hotfixes and patches.

## Description

Queries local or remote computers for installed Windows updates from the last 3 months and exports to CSV.

## Usage

```batch
:: Run the script
GETPatchesLast3months.bat
```

## Output

Generates CSV file with hotfix information:
- Hotfix ID (KB number)
- Description
- Install date
- Installed by

## Files

- `GETPatchesLast3months.bat` - Main script
- `support/` - Support files and utilities

## Requirements

- Windows OS
- PowerShell
- Administrative privileges

## Author

Wk19-hub

## License

MIT
