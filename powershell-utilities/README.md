# PowerShell Utilities

Collection of useful PowerShell scripts for system administration.

## Description

Various PowerShell utilities for:
- Getting PC names and models
- Querying service tags remotely
- Retrieving OS information from AD
- Getting installed programs remotely

## Scripts

### PC NAME Model SV.ps1
Retrieves computer name, model, and service tag.

### get service nametag remotely/
Scripts to query Dell service tags from remote computers.

### get operating systems from AD/
Query AD for computer OS information.

### get Installed programs remotely/
Query installed software on remote computers.

## Usage

```powershell
# Run individual scripts
.\PC NAME Model SV.ps1

# Or navigate to subfolder
cd "get Installed programs remotely"
.\installed programs remotely by anonymous.ps1
```

## Requirements

- PowerShell 5.1+
- Appropriate access to target systems
- AD module for AD queries

## Author

Wk19-hub

## License

MIT
