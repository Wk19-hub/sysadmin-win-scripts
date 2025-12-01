# OS and PC Model Retriever

PowerShell script to retrieve operating system and computer model information.

## Description

Queries remote computers using WMI to gather OS version, PC model, BIOS info, and exports to a report.

## Usage

```powershell
.\OS and pc model .ps1
```

## Output

CSV/HTML report containing:
- Computer name
- Operating system
- OS version
- PC model
- BIOS serial number

## Configuration

Edit the script to set:
- Input file path with computer names
- Output file location

## Requirements

- PowerShell 5.1+
- WMI access on targets
- Network connectivity

## Author

Wk19-hub

## License

MIT
