# BIOS Configuration Scripts

This folder contains scripts for configuring BIOS settings on Dell OptiPlex computers using the Dell Client Configuration Toolkit (CCTK).

## Scripts

- `OptiPlex.sh`: General BIOS configuration for OptiPlex models.
- `OptiPlex 3020_33FFC72.sh`: BIOS configuration for OptiPlex 3020 with service tag 33FFC72.

## Usage

Run the script on a Linux system with CCTK installed as root:

```bash
sudo ./OptiPlex.sh
```

## Requirements

- Linux distribution with CCTK and srv-admin RPMs installed.
- Root privileges.
- BIOS passwords set to 'securepassword' (update in script if different).

## Author

Wk19-hub

## Notes

- Ensure CCTK is properly installed and accessible.
- Review and update BIOS settings in the script as needed.
- The scripts generate a log file with the same name as the script plus .log extension.