# IP to Hostname Resolver

PowerShell script to resolve hostnames from IP addresses using DNS lookups.

## Description

This script reads IP addresses from a file and performs DNS reverse lookups to find corresponding hostnames.

## Usage

```powershell
.\DNS.ps1
```

## Configuration

Edit the script to set:
- Input file path containing IP addresses
- Output file path for results

## Files

- `DNS.ps1` - Main PowerShell script
- `servers.txt` - Input file with IP addresses (one per line)

## Requirements

- PowerShell 5.1+
- DNS server access
- Network connectivity

## Author

Wk19-hub

## License

MIT
