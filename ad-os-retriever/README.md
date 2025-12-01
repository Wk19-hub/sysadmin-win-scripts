# AD OS Retriever

PowerShell script to retrieve operating system information from Active Directory.

## Description

This script queries Active Directory to get operating system details for computers in a specified OU, useful for inventory and compliance reporting.

## Usage

```powershell
.\Operating systems AD.ps1
```

You will be prompted for domain credentials.

## Output

Exports computer OS information including:
- Computer name
- Operating system
- OS version
- Service pack

## Requirements

- PowerShell 5.1+
- Active Directory PowerShell module
- Domain credentials with read access
- RSAT tools installed

## Author

Wk19-hub

## License

MIT
