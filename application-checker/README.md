# Application Checker

PowerShell script to check if specific applications are installed on remote computers.

## Description

This script queries remote computers for installed applications matching a search term and exports results to CSV.

## Usage

1. Create a `computers.txt` file with target computer names (one per line)
2. Run the script:
   ```powershell
   .\main.ps1
   ```
3. Enter the application name when prompted
4. Results are saved to `output.csv`

## Files

- `main.ps1` - Main PowerShell script
- `computers.txt` - List of target computers
- `output.csv` - Generated output file

## Requirements

- PowerShell 5.1+
- WinRM enabled on target computers
- Administrative privileges

## Author

Wk19-hub

## License

MIT
