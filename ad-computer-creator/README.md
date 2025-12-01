# AD Computer Creator

PowerShell script to bulk create computer objects in Active Directory from a CSV file.

## Description

This script imports computer names from a CSV file and creates corresponding computer objects in a specified Active Directory Organizational Unit (OU).

## Usage

```powershell
.\Create Computers from CV .ps1
```

## Configuration

Edit the script to set:
- `$CSV` - Path to your CSV file with computer names
- `$OU` - Target OU distinguished name

### CSV Format

```csv
Computer
PC001
PC002
PC003
```

## Requirements

- PowerShell 5.1+
- Active Directory PowerShell module
- Domain admin or delegated permissions to create computer objects
- RSAT tools installed

## Author

Wk19-hub

## License

MIT
