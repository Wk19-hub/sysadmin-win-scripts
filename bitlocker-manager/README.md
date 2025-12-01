# BitLocker Manager

PowerShell scripts for managing BitLocker encryption on remote computers.

## Description

Collection of scripts for:
- Checking BitLocker prerequisites
- Applying co-managed policies
- Verifying encryption status
- Managing recovery keys

## Scripts

### BitLocker Prerequisites Script
Checks if computers meet BitLocker requirements:
- TPM availability
- UEFI/Secure Boot status
- Drive compatibility

### Applying CoManaged Policies
Applies BitLocker policies for co-managed environments (SCCM + Intune).

## Usage

```powershell
# Check prerequisites
.\BitLockerPrerequisites.ps1

# Apply policies
.\coScript.ps1
```

## Files

- `BitLockerPrerequisites.ps1` - Prerequisite checker
- `BitLockerPrerequisites - OU.ps1` - OU-based checker
- `coScript.ps1` - Co-management policy script
- `GetConnected.ps1` - Connection verification
- `computers.txt` - Target computer list

## Requirements

- PowerShell 5.1+
- Administrative privileges
- BitLocker feature enabled
- TPM for hardware encryption

## Author

Wk19-hub

## License

MIT
