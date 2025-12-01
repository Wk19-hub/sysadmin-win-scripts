# User Account Unlocker

PowerShell script to find and unlock locked Active Directory user accounts.

## Description

This script searches Active Directory for locked user accounts in a specified OU, exports them to CSV, and unlocks them automatically.

## Usage

```powershell
.\unlock user domain.ps1
```

## Configuration

Edit the script to modify:
- `SearchBase` - Target OU path (e.g., "OU=Users,OU=Location,DC=domain,DC=com")
- Export path for the CSV file

## Output

- CSV file with locked account details:
  - DisplayName
  - EmailAddress
  - Title
  - DistinguishedName
  - SamAccountName

## Requirements

- PowerShell 5.1+
- Active Directory PowerShell module
- Domain admin or account unlock privileges
- RSAT tools installed

## Author

Wk19-hub

## License

MIT
