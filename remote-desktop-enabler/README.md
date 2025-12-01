# Remote Desktop Enabler

Scripts to enable Remote Desktop on computers remotely.

## Description

Enables Remote Desktop Protocol (RDP) on target computers through registry modifications and firewall rules.

## Subfolders

### Remote add Reg/
Adds registry keys to enable RDP.

### Remote Manually Enable/
Manual enablement scripts with additional configuration options.

## Usage

```batch
:: Run enablement scripts
1.bat
```

## Files

- `1.bat` - Batch runner
- `Local_account_Script.bat` - Main script
- `computers.txt` - Target computers
- `local-security-policy.inf` - Security policy template

## Requirements

- Windows OS
- Administrative privileges
- PsExec (PsTools)

## Warning

⚠️ Enabling RDP can expose systems to security risks. Ensure proper firewall rules and authentication.

## Author

Wk19-hub

## License

MIT
