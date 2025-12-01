# Host Serial Number Getter

Batch script to retrieve BIOS serial numbers from remote computers.

## Description

Uses WMIC to query remote computers for their BIOS serial numbers, useful for asset management and inventory.

## Usage

```batch
:: Run the script
1.bat
```

## Output

Generates `ServerSerialNumbers.htm` with serial number information.

## Files

- `1.bat` - Main script
- `computerlist.txt` - Target computer list
- `ServerSerialNumbers.htm` - Generated HTML report

## Requirements

- Windows OS
- WMIC access on targets
- Network connectivity

## Author

Wk19-hub

## License

MIT
