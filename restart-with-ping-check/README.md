# Restart With Ping Check

Batch script to restart computers with online verification.

## Description

Checks if computers are online before sending restart commands, logging offline machines separately.

## Usage

```batch
:: Single computer
restart_script2.bat COMPUTERNAME

:: Multiple computers
1.bat
```

## Files

- `1.bat` - Batch runner
- `restart_script2.bat` - Main restart script
- `restart.txt` - Target computer list

## Requirements

- Windows OS
- Administrative privileges
- Network connectivity

## Author

Wk19-hub

## License

MIT
