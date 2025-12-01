# Endpoint Security Installer

Scripts for deploying McAfee Endpoint Security (ENS).

## Description

Deploys McAfee Endpoint Security suite to multiple computers with all required certificates and configurations.

## Usage

```batch
:: Run deployment
1.bat
```

## Files

- `1.bat` - Batch runner
- `PH.bat` - Main installation script
- `computers.txt` - Target computers
- `ENS/` - ENS installation package
  - `McAfeeCerts.xml` - Certificate configuration

## Requirements

- Windows OS
- PsExec (PsTools)
- McAfee ENS package
- Administrative privileges
- Valid McAfee license

## Author

Wk19-hub

## License

MIT
