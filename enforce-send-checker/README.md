# Enforce Send Checker

Batch script for checking and enforcing policy send status.

## Description

Verifies that policies have been properly sent and applied to target computers.

## Usage

```batch
:: Single computer
Check_Enforce_Send.bat COMPUTERNAME

:: Multiple computers
1.bat
```

## Files

- `1.bat` - Batch runner
- `Check_Enforce_Send.bat` - Main check script
- `computers.txt` - Target computers
- `success.txt` - Successful checks
- `Error.txt` - Failed checks

## Requirements

- Windows OS
- Administrative privileges

## Author

Wk19-hub

## License

MIT
