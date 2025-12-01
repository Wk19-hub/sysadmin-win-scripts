# Remote App Inventory

Batch script to retrieve installed applications from remote computers.

## Description

Uses WMIC to query remote computers for installed applications and generates an HTML report.

## Usage

```batch
:: Run with computer name
1.bat COMPUTERNAME
```

## Output

Generates `app.htm` with:
- Application name
- Version
- Vendor

## Requirements

- Windows OS
- WMIC access
- Network connectivity

## Author

Wk19-hub

## License

MIT
