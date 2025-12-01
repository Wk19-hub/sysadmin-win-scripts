# Copy With Ping

Batch script to copy files to remote computers with ping verification.

## Description

This script checks if target computers are online before copying files to them, preventing wasted time on unreachable machines.

## Usage

```batch
:: Single computer
Copy_With_Ping.bat COMPUTERNAME

:: Multiple computers
1.bat
```

## Features

- Ping check before copy operation
- Logs offline machines
- Error handling for failed copies
- Success/failure tracking

## Files

- `1.bat` - Batch runner
- `Copy_With_Ping.bat` - Main copy script
- `computers.txt` - Target computer list
- `success.txt` - Successful copies log
- `Error.txt` - Failed copies log
- `OfflineMachineshost.txt` - Offline machines log

## Requirements

- Windows OS
- Network access to admin shares (C$)
- Administrative privileges on targets

## Author

Wk19-hub

## License

MIT
