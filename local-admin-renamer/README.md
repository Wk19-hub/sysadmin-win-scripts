# Local Admin Rename Script

This script renames the local Administrator account on remote computers after enabling PowerShell remoting.

## Usage

Run the script with parameters if needed:

```powershell
.\local admin rename.ps1 -NewAdminName "NewAdmin"
```

## Requirements

- Administrative privileges.
- Pstools installed in the Pstools subdirectory.
- Files: servers.txt, livePCs.txt, deadPCs.txt in the same directory.

## Author

Wk19-hub