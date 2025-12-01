# Installed Software Getter

PowerShell script to query installed software on local or remote computers.

## Description

This comprehensive script retrieves detailed information about installed software from Windows computers by querying the registry.

## Usage

```powershell
# Local computer
.\Get-InstalledSoftware.ps1

# Remote computer
.\Get-InstalledSoftware.ps1 -ComputerName "SERVER01"

# Multiple computers via pipeline
Get-Content computers.txt | .\Get-InstalledSoftware.ps1
```

## Output

Returns objects with properties:
- Computer name
- Software name
- Version
- Publisher
- Install date

## Requirements

- PowerShell 5.1+
- Remote registry access for remote queries
- Administrative privileges

## Author

Wk19-hub

## License

MIT
