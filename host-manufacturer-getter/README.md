# Host Manufacturer Getter

Batch script to retrieve computer manufacturer and model information.

## Description

Queries remote computers using WMIC to get hardware information including manufacturer, model, and system type.

## Usage

```batch
:: Run the script
1.bat
```

## Output

Generates `ServerSerialNumbers.htm` with:
- Computer name
- Manufacturer
- Model
- System type
- Username

## Files

- `1.bat` - Main script
- `computerlist.txt` - Target computers
- `ServerSerialNumbers.htm` - Generated report

## Requirements

- Windows OS
- WMIC access on targets
- Administrative privileges

## Author

Wk19-hub

## License

MIT
